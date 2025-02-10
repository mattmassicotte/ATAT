import Foundation
import Testing

import ATAT

struct DateContainer: Decodable {
	let date: Date
}

struct ATJSONDecoderTests {
	@Test func offsetDate() throws {
		let json = """
{"date": "2024-11-17T12:23:53+00:00"}
"""
		let container = try JSONDecoder.atJSONDecoder.decode(DateContainer.self, from: Data(json.utf8))
		
		#expect(container.date.timeIntervalSince1970 == 1731846233)
	}
	
	@Test func decimalOffsetDate() throws {
		let json = """
{"date": "2024-11-15T18:16:35.907Z"}
"""
		let container = try JSONDecoder.atJSONDecoder.decode(DateContainer.self, from: Data(json.utf8))
		
		#expect(container.date.timeIntervalSince1970 == 1731694595.907)
	}
}


