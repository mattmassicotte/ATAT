import Foundation

// should this be a JSONDecoder subclass?
public struct ATJSONDecoder: Sendable {
	public let wrappedDecoder = JSONDecoder()
	private let iso8061DecimalDecoder: DateFormatter
	private let iso8061OffsetFormatter: DateFormatter

	public init() {
		self.iso8061DecimalDecoder = DateFormatter()
		
		// 2024-11-15T18:16:35.907Z
		iso8061DecimalDecoder.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
		
		self.iso8061OffsetFormatter = DateFormatter()
		
		// 2024-11-17T12:23:53+00:00
		iso8061OffsetFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
		
		wrappedDecoder.dateDecodingStrategy = .custom(decodeDate)
	}
	
	private func decodeDate(_ decoder: any Decoder) throws -> Date {
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
	
	public func decode<T>(_ type: T.Type, from data: Data) throws -> T where T : Decodable {
		try wrappedDecoder.decode(type, from: data)
	}
}
