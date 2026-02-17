extension App.Bsky.Embed {
	public struct Defs {
	}
}

extension App.Bsky.Embed.Defs {
	public struct AspectRatio: Codable, Hashable, Sendable {
		public let width: Int
		public let height: Int
	}
}

extension App.Bsky.Embed {
	public enum Record: Codable, Hashable, Sendable {
		case main(Main)
		case view(View)
		case viewBlocked(App.Bsky.Embed.Record.ViewBlocked)
		case unrecognized(String)

		public static let nsid = "app.bsky.embed.record"
		public typealias Main = RecordContainer<Com.ATProto.Repo.StrongRef>
		private enum CodingKeys: String, CodingKey {
			case type = "$type"
		}

		public init(from decoder: any Decoder) throws {
			let container = try decoder.container(keyedBy: CodingKeys.self)

			if container.contains(.type) == false {
				self = .main(try Main(from: decoder))
				return
			}

			let nsid = try container.decode(String.self, forKey: .type)
			switch nsid {
			case Self.nsid:
				self = .main(try Main(from: decoder))
			case "\(Self.nsid)#view":
				self = try .view(View(from: decoder))
			case App.Bsky.Embed.Record.ViewBlocked.nsid:
				self = .viewBlocked(try App.Bsky.Embed.Record.ViewBlocked(from: decoder))
			default:
				print("BSKY unhandled nsid:", nsid, decoder.codingPath)
				self = .unrecognized(nsid)
			}
		}

		public func encode(to encoder: any Encoder) throws {
			var container = encoder.container(keyedBy: CodingKeys.self)

			switch self {
			case .main(let main):
				try main.encode(to: encoder)
			case .view(let value):
				try container.encode("\(Self.nsid)#view", forKey: .type)

				try value.encode(to: encoder)
			case .viewBlocked(let value):
				try container.encode(App.Bsky.Embed.Record.ViewBlocked.nsid, forKey: .type)

				try value.encode(to: encoder)
			case .unrecognized:
				break
			}
		}
	}
}

extension App.Bsky.Embed.Record {
	public typealias View = RecordContainer<ViewUnion>

	public enum ViewUnion: Codable, Hashable, Sendable {
		case viewRecord(App.Bsky.Embed.Record.ViewRecord)
		case viewNotFound
		case viewBlocked(App.Bsky.Embed.Record.ViewBlocked)
		case viewDetached
		case generatorView
		case listView
		case labelerView
		case starterBackViewBasic
		case unhandled(String)

		private enum CodingKeys: String, CodingKey {
			case type = "$type"
		}

		public init(from decoder: any Decoder) throws {
			let container = try decoder.container(keyedBy: CodingKeys.self)

			let nsid = try container.decode(String.self, forKey: .type)
			switch nsid {
			case App.Bsky.Embed.Record.ViewRecord.nsid:
				self = .viewRecord(try App.Bsky.Embed.Record.ViewRecord(from: decoder))
			case App.Bsky.Embed.Record.ViewBlocked.nsid:
				self = .viewBlocked(try App.Bsky.Embed.Record.ViewBlocked(from: decoder))
			default:
				print("BSKY unhandled nsid:", nsid, decoder.codingPath)
				self = .unhandled(nsid)
			}
		}

		public func encode(to encoder: any Encoder) throws {
			fatalError()
		}
	}
}

extension App.Bsky.Embed.Record {
	public struct ViewRecord: Codable, Hashable, Sendable {
		public static let nsid = "\(App.Bsky.Embed.Record.nsid)#viewRecord"

		public let uri: ATProtoURI
		public let cid: ATProtoCID
		public let author: App.Bsky.Actor.Defs.ProfileViewBasic
		public let replyCount: Int?
		public let repostCount: Int?
		public let likeCount: Int?
		public let quoteCount: Int?
	}
}

extension App.Bsky.Embed.Record {
	public struct ViewBlocked: Codable, Hashable, Sendable {
		public static let nsid = "\(App.Bsky.Embed.Record.nsid)#viewBlocked"

		public let uri: ATProtoURI
		public let blocked: Bool
//		public let author: App.Bsky.Feed.Defs.BlockedAuthor
	}
}
