import Foundation

extension Date {
	public init(microsecondsSince1970: UInt64) {
		let interval = Double(microsecondsSince1970) / Double(1_000_000)

		self.init(timeIntervalSince1970: interval)
	}

	public var microsecondsSince1970: UInt64 {
		UInt64(timeIntervalSince1970 * Double(1_000_000))
	}
}

public struct ATProtoTID: Codable, Hashable, Sendable {
	/// microseconds since epoch
	public var timestamp: UInt64
	public var clockIdentifier: Int

	public init(timestamp: UInt64, clockIdentifier: Int = 0) {
		self.timestamp = timestamp
		self.clockIdentifier = clockIdentifier
	}

	public init(date: Date, clockIdentifier: Int = 0) {
		self.init(
			timestamp: date.microsecondsSince1970,
			clockIdentifier: clockIdentifier
		)
	}

	public init(string: String) throws {
		self.clockIdentifier = Int(try Self.decodeInteger(from: string.suffix(2)))
		self.timestamp = try Self.decodeInteger(from: string.prefix(11))
	}

	public init(from decoder: any Decoder) throws {
		let container = try decoder.singleValueContainer()

		let input = try container.decode(String.self)

		try self.init(string: input)
	}

	public func encode(to encoder: any Encoder) throws {
		var container = encoder.singleValueContainer()

		try container.encode(encodedString())
	}

	public var date: Date {
		Date(microsecondsSince1970: timestamp)
	}

	public func encodedString() -> String {
		let clockStr = ATProtoTID.encodeInteger(UInt64(clockIdentifier)).padding(toLength: 2, withPad: "2", startingAt: 0)
		let stampStr = ATProtoTID.encodeInteger(timestamp).padding(toLength: 11, withPad: "2", startingAt: 0)

		return stampStr + clockStr
	}
}

enum ATProtoTIDError: Error {
	case invalidCharacter
	case inputTooLong
}

extension ATProtoTID {
	private static func encodeInteger(_ input: UInt64) -> String {
		var remaining = input
		var encoded = String()

		while remaining > 0 {
			let index = remaining % 32
			remaining /= 32

			if index > 31 {
				assertionFailure("Index is invalid")
			}

			let char: Character = switch index {
			case 0: "2"
			case 1: "3"
			case 2: "4"
			case 3: "5"
			case 4: "6"
			case 5: "7"
			case 6: "a"
			case 7: "b"
			case 8: "c"
			case 9: "d"
			case 10: "e"
			case 11: "f"
			case 12: "g"
			case 13: "h"
			case 14: "i"
			case 15: "j"
			case 16: "k"
			case 17: "l"
			case 18: "m"
			case 19: "n"
			case 20: "o"
			case 21: "p"
			case 22: "q"
			case 23: "r"
			case 24: "s"
			case 25: "t"
			case 26: "u"
			case 27: "v"
			case 28: "w"
			case 29: "x"
			case 30: "y"
			case 31: "z"
			default:
				"2"
			}

			encoded.insert(char, at: encoded.startIndex)
		}

		return encoded
	}
	/// base32-sorted decoding
	private static func decodeInteger<Input: StringProtocol>(from string: Input) throws -> UInt64 {
		if string.count > 11 {
			throw ATProtoTIDError.inputTooLong
		}

		var result = UInt64(0)

		for char in string {
			let value = switch char {
			case "2": 0
			case "3": 1
			case "4": 2
			case "5": 3
			case "6": 4
			case "7": 5
			case "a": 6
			case "b": 7
			case "c": 8
			case "d": 9
			case "e": 10
			case "f": 11
			case "g": 12
			case "h": 13
			case "i": 14
			case "j": 15
			case "k": 16
			case "l": 17
			case "m": 18
			case "n": 19
			case "o": 20
			case "p": 21
			case "q": 22
			case "r": 23
			case "s": 24
			case "t": 25
			case "u": 26
			case "v": 27
			case "w": 28
			case "x": 29
			case "y": 30
			case "z": 31
			default:
				throw ATProtoTIDError.invalidCharacter
			}

			result = result * 32 + UInt64(value)
		}

		return result
	}
}

extension ATProtoTID: CustomStringConvertible {
	public var description: String {
		"<TID: \(timestamp), \(clockIdentifier), \"\(encodedString())\">"
	}
}
