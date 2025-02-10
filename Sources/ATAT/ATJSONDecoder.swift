import Foundation

extension JSONDecoder {
	public static var atJSONDecoder: JSONDecoder {
		let iso8061DecimalDecoder = DateFormatter()
		iso8061DecimalDecoder.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
		
		let iso8061OffsetFormatter = DateFormatter()
		iso8061OffsetFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
		
		let decoder = JSONDecoder()
		decoder.dateDecodingStrategy = .custom { decoder in
			let container = try decoder.singleValueContainer()
			let string = try container.decode(String.self)
			
			if let date = iso8061DecimalDecoder.date(from: string) {
				return date
			}
			
			if let date = iso8061OffsetFormatter.date(from: string) {
				return date
			}
			
			throw DecodingError.dataCorrupted(.init(codingPath: decoder.codingPath, debugDescription: "Undecodable date \(string)"))
		}
		
		return decoder
	}
}
