public enum UnknownRecord: Codable, Hashable, Sendable {
	private enum CodingKeys: String, CodingKey {
		case type = "$type"
	}

	case post(App.Bsky.Feed.Post)
	case profile(App.Bsky.Actor.Profile)
	case unhandled(String)

	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)

		let value = try container.decode(String.self, forKey: .type)

		switch value {
		case App.Bsky.Feed.Post.nsid:
			self = .post(try App.Bsky.Feed.Post(from: decoder))
		case App.Bsky.Actor.Profile.nsid:
			self = .profile(try App.Bsky.Actor.Profile(from: decoder))
		default:
			print("unhandled record type:", value, decoder.codingPath)
			self = .unhandled(value)
		}
	}

	public func encode(to encoder: any Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)

		switch self {
		case .profile(let value):
			try container.encode(App.Bsky.Actor.Profile.nsid, forKey: .type)

			try value.encode(to: encoder)
		case .post(let value):
			try container.encode(App.Bsky.Feed.Post.nsid, forKey: .type)

			try value.encode(to: encoder)
		default:
			print("unhandled record type: \(self)")
		}
	}
}

