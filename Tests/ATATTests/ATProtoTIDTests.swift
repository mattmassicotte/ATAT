import Foundation
import Testing

import ATAT

struct ATProtoTIDTests {
	@Test func decodeZero() throws {
		let tid = try ATProtoTID(string: "2222222222222")

		#expect(tid.timestamp == 0)
		#expect(tid.date == Date.init(timeIntervalSince1970: 0))
	}
	
	@Test
	func decode() throws {
		let tid = try ATProtoTID(string: "3m4cjzwwzv322")

		let expected: UInt64 = 1761709682229089

		#expect(tid.clockIdentifier == 0)
		#expect(tid.timestamp == expected)
		#expect(tid.date == Date.init(microsecondsSince1970: expected))


	}

	@Test
	func encode() throws {
		let tid = ATProtoTID(timestamp: 1761709682229089, clockIdentifier: 0)

		#expect(tid.encodedString() == "3m4cjzwwzv322")
	}

	@Test
	func jsonEncoding() throws {
		let tid = ATProtoTID(timestamp: 1761709682229089, clockIdentifier: 0)

		let data = try JSONEncoder().encode(tid)

		#expect(String(decoding: data, as: UTF8.self) == "\"3m4cjzwwzv322\"")

		let output = try JSONDecoder().decode(ATProtoTID.self, from: data)

		#expect(output.clockIdentifier == 0)
		#expect(output.timestamp == 1761709682229089)
		#expect(output == tid)
	}
}
