public enum UnknownRecord: Codable, Hashable, Sendable {
	private enum CodingKeys: String, CodingKey {
		case type = "$type"
	}

	case post(App.Bsky.Feed.Post)
	case unhandled(String)

	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		let value = try container.decode(String.self, forKey: .type)

		switch value {
		case App.Bsky.Feed.Post.nsid:
			self = .post(try App.Bsky.Feed.Post(from: decoder))
		default:
			print("unhandled record type:", value, decoder.codingPath)
			self = .unhandled(value)
		}
	}

	public func encode(to encoder: any Encoder) throws {
//		var container = encoder.container(keyedBy: CodingKeys.self)

		switch self {
		default:
			print("unhandled record type: \(self)")
		}
	}
}

