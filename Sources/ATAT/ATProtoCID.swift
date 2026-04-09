import Foundation

#if CIDDecoding
import Base32
#endif

public enum Multibase: UInt8, Hashable, Sendable, Codable {
	case base32 = 0x62    // "b"
	case base58BTC = 0x7a // "z
}

public enum Multicodec: UInt8, Hashable, Sendable, Codable {
	case DAGCBOR = 0x71
}

public struct Multihash: Hashable, Sendable, Codable {
	public enum Function: UInt8, Hashable, Sendable, Codable {
		case SHA2 = 0x12
	}

	public let function: Function
	public let digestSize: Int

	public init(function: Function, digestSize: Int) {
		self.function = function
		self.digestSize = digestSize
	}
}

public enum MultihashError: Error {
	case unsupported(Int, Int)
}

public enum CIDError: Error {
	case inputTooShort
	case unsupportedVersion(Int)
	case unsupportedBase(Character)
	case unsupportedCodec(Int)
}

/// A representation of the CID standard.
///
/// https://dasl.ing/cid.html
///
/// - Warning: The functionality of this type is affeted by the `CIDDecoding` and `SwiftCrypto` traits. Depends on your needs, you many require one or both.
public struct ATProtoCID: Hashable, Sendable {
	public let version: Int = 1
	public let base: Multibase
	public let codec: Multicodec
	public let multihash: Multihash
	public let digest: Data
#if !CIDDecoding
	private let codedString: String
#endif

#if CIDDecoding
	public init(
		base: Multibase = .base32,
		codec: Multicodec = .DAGCBOR,
		hash: Multihash = Multihash(function: .SHA2, digestSize: 256),
		digest: Data
	) {
		self.base = base
		self.codec = codec
		self.multihash = hash
		self.digest = digest
	}

	public init(
		base: Multibase = .base32,
		codec: Multicodec = .DAGCBOR,
		hash: Multihash = Multihash(function: .SHA2, digestSize: 256),
		data: Data
	) throws {
		self.base = base
		self.codec = codec
		self.multihash = hash
		self.digest = try hash.hash(data)
	}

	/// Create a new instance with an encoding string.
	public init(_ string: String) throws {
		guard
			let leading = string.first,
			let base = leading.utf8.first else {
			throw CIDError.inputTooShort
		}

		guard base == Multibase.base32.rawValue else {
			throw CIDError.unsupportedBase(leading)
		}

		self.base = .base32

		let encoded = String(string.dropFirst())
		let decoded = try Base32.decode(encoded)

		guard decoded.count > 3 else {
			throw CIDError.inputTooShort
		}

		guard decoded[0] == 1 else {
			throw CIDError.unsupportedVersion(Int(decoded[0]))
		}

		guard decoded[1] == Multicodec.DAGCBOR.rawValue else {
			throw CIDError.unsupportedCodec(Int(decoded[1]))
		}

		self.codec = .DAGCBOR

		guard
			decoded[2] == Multihash.Function.SHA2.rawValue,
			decoded[3] == 32
		else {
			throw MultihashError.unsupported(Int(decoded[2]), Int(decoded[3]))
		}

		self.multihash = Multihash(function: .SHA2, digestSize: 256)
		self.digest = Data(decoded.dropFirst(4))
	}

	public var baseEncodedString: String {
		let prefix = Data([0x01, Multicodec.DAGCBOR.rawValue, Multihash.Function.SHA2.rawValue, 32])

		return "b" + Base32.encode(prefix + digest, options: [.pad(false), .letterCase(.lower)])
	}
#else
	public init(
		base: Multibase = .base32,
		codec: Multicodec = .DAGCBOR,
		hash: Multihash = Multihash(function: .SHA2, digestSize: 256),
		digest: Data,
		codedString: String
	) {
		self.base = base
		self.codec = codec
		self.multihash = hash
		self.digest = digest
		self.codedString = codedString
	}

	public init(
		base: Multibase = .base32,
		codec: Multicodec = .DAGCBOR,
		hash: Multihash = Multihash(function: .SHA2, digestSize: 256),
		data: Data,
		codedString: String
	) throws {
		self.base = base
		self.codec = codec
		self.multihash = hash
		self.digest = try hash.hash(data)
		self.codedString = codedString
	}

	/// Create a new instance with an assumed base32, DAGCBOR, SHA256 coded string.
	///
	/// This function does no decoding or validation and assumes a well-formed input. However, it
	/// does still throw to attempt to maintain the API shape of the validating version.
	///
	/// - Warning: Package trait `CIDDecoding` is needed for full decoding of the input.
	public init(_ string: String) throws {
		self.base = .base32
		self.codec = .DAGCBOR
		self.multihash = Multihash(function: .SHA2, digestSize: 256)
		self.digest = Data()
		self.codedString = string
	}

	public var baseEncodedString: String {
		codedString
	}
#endif
}

extension ATProtoCID: Encodable {
	public func encode(to encoder: any Encoder) throws {
		var container = encoder.singleValueContainer()

		try container.encode(baseEncodedString)
	}
}

extension ATProtoCID: Decodable {
	public init(from decoder: any Decoder) throws {
		let container = try decoder.singleValueContainer()

		let encodingString = try container.decode(String.self)

		try self.init(encodingString)
	}
}
