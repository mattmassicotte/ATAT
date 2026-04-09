import Testing
import Foundation

import ATAT
#if CIDDecoding
import BaseX

struct ATProtoCIDTests {
	@Test
	func cidDecode() throws {
		let value = "bafyreic62lzdtesykbkti6nmdt3htsfu34jwjz3bkqy4q4zntegllhmyxy"

		let cid = try ATProtoCID(value)

		let expected = try BaseX.decode("5ED2F239925850553479AC1CF679C8B4DF1364E7615431C8732D990CB59D98BE", as: .base16Hex)

		#expect(cid.digest == expected)
	}

	@Test
	func cidEncode() throws {
		let input = Data("abc".utf8)
		let cid = try ATProtoCID(data: input)

		let expected = try BaseX.decode("ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad", as: .base16Hex)

		#expect(cid.digest == expected)
		#expect(cid.baseEncodedString == "bafyreif2pall7dybz7vecqka3zo24irdwabwdi4wc55jznaq75q7eaavvu")
	}
}
#endif
