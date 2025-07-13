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
		
		if let date = decodeDate(string) {
			return date
		}

		throw DecodingError.dataCorrupted(.init(codingPath: decoder.codingPath, debugDescription: "Undecodable date \(string)"))
	}

	public func decodeDate(_ string: String) -> Date? {
		if let date = iso8061DecimalDecoder.date(from: string) {
			return date
		}

		if let date = iso8061OffsetFormatter.date(from: string) {
			return date
		}

		return nil
	}

	public func decode<T>(_ type: T.Type, from data: Data) throws -> T where T : Decodable {
		try wrappedDecoder.decode(type, from: data)
	}
}

public final class ATJSONEncoder: JSONEncoder, @unchecked Sendable {
	private let encoder = JSONEncoder()
	private let iso8061DecimalFormatter = DateFormatter()
	
	public override init() {
		super.init()
		
		iso8061DecimalFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
		
		encoder.dateEncodingStrategy = .custom(encodeDate)
	}
	
	private func encodeDate(_ date: Date, _ encoder: any Encoder) throws -> Void {
		let string = iso8061DecimalFormatter.string(from: date)
		
		var container = encoder.singleValueContainer()
		
		try container.encode(string)
	}
	
	override public func encode<T>(_ value: T) throws -> Data where T : Encodable {
		try encoder.encode(value)
	}
}
