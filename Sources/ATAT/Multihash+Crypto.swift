#if canImport(Crypto)
import Crypto
#elseif canImport(CryptoKit)
import CryptoKit
#endif

import Foundation

extension Multihash {
	/// Compute the digest for input data.
	///
	/// - Warning: If you are on a non-Apple platform, the `SwiftCrypto` trait must be enabled for this to work.
	public func hash(_ data: Data) throws -> Data {
		switch (function, digestSize) {
#if canImport(Crypto) || canImport(CryptoKit)
		case (.SHA2, 256):
			return Data(SHA256.hash(data: data))
#endif
		default:
			throw MultihashError.unsupported(Int(function.rawValue), digestSize)
		}
	}
}
