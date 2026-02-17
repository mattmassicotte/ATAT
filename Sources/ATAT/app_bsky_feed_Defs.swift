import Foundation

extension App.Bsky.Feed {
	public struct Defs {
	}
}

extension App.Bsky.Feed.Defs {
	public struct FeedViewPost: Codable, Hashable, Sendable {
		public let post: PostView
		public let reason: ReasonUnion?
		public let reply: App.Bsky.Feed.Defs.ReplyRef?
	}
}

extension App.Bsky.Feed.Defs.FeedViewPost {
	public enum ReasonUnion: Codable, Hashable, Sendable {
		case reasonRepost(App.Bsky.Feed.Defs.ReasonRepost)
		case reasonPin
		case unhandled(String)

		private enum CodingKeys: String, CodingKey {
			case type = "$type"
		}

		public init(from decoder: any Decoder) throws {
			let container = try decoder.container(keyedBy: CodingKeys.self)

			let nsid = try container.decode(String.self, forKey: .type)
			switch nsid {
			case "app.bsky.feed.defs#reasonRepost":
				self = .reasonRepost(try App.Bsky.Feed.Defs.ReasonRepost(from: decoder))
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

extension App.Bsky.Feed.Defs {
	public struct PostView: Codable, Hashable, Sendable {
		public let uri: ATProtoURI
		public let cid: ATProtoCID
		public let record: UnknownRecord
		public let author: App.Bsky.Actor.Defs.ProfileViewBasic
		public let embed: EmbedUnion?
		public let likeCount: Int?
		public let replyCount: Int?
		public let repostCount: Int?
		public let quoteCount: Int?
		public let viewer: ViewerState
		public let indexedAt: Date
	}
}

extension App.Bsky.Feed.Defs.PostView {
	public enum EmbedUnion: Codable, Hashable, Sendable {
		case imagesView(App.Bsky.Embed.Images.View)
		case videoView(App.Bsky.Embed.Video.View)
		case externalView(App.Bsky.Embed.External.View)
		case recordView(App.Bsky.Embed.Record)
		case recordWithMediaView(App.Bsky.Embed.RecordWithMedia.View)
		case unhandled(String)

		private enum CodingKeys: String, CodingKey {
			case type = "$type"
		}

		public init(from decoder: any Decoder) throws {
			let container = try decoder.container(keyedBy: CodingKeys.self)

			let nsid = try container.decode(String.self, forKey: .type)
			switch nsid {
			case App.Bsky.Embed.External.View.nsid:
				self = try .externalView(App.Bsky.Embed.External.View(from: decoder))
			case "\(App.Bsky.Embed.Record.nsid)#view":
				self = .recordView(try App.Bsky.Embed.Record(from: decoder))
			case "\(App.Bsky.Embed.RecordWithMedia.nsid)#view":
				self = .recordWithMediaView(try App.Bsky.Embed.RecordWithMedia.View(from: decoder))
			case "\(App.Bsky.Embed.Images.nsid)#view":
				self = .imagesView(try App.Bsky.Embed.Images.View(from: decoder))
			case App.Bsky.Embed.Video.View.nsid:
				self = try .videoView(App.Bsky.Embed.Video.View(from: decoder))
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

extension App.Bsky.Feed.Defs {
	public struct ReasonRepost: Codable, Hashable, Sendable {
		public let by: App.Bsky.Actor.Defs.ProfileViewBasic
		public let indexedAt: Date
		public let cid: ATProtoCID?
		public let uri: ATProtoURI?
	}
}

extension App.Bsky.Feed.Defs {
	public struct ViewerState: Codable, Hashable, Sendable {
		public let repost: ATProtoURI?
		public let like: ATProtoURI?
		public let bookmarked: Bool?
		public let threadMuted: Bool?
		public let replyDisabled: Bool?
		public let embeddingDisabled: Bool?
		public let pinned: Bool?
	}
}

extension App.Bsky.Feed.Defs {
	public struct ReplyRef: Codable, Hashable, Sendable {
		public let root: RootUnion
		public let parent: ParentUnion
		public let grandparentAuthor: App.Bsky.Actor.Defs.ProfileViewBasic?
	}
}

extension App.Bsky.Feed.Defs.ReplyRef {
	public enum RootUnion: Codable, Hashable, Sendable {
		case postView(App.Bsky.Feed.Defs.PostView)
		case notFoundPost
		case blockedPost
		case unhandled(String)

		private enum CodingKeys: String, CodingKey {
			case type = "$type"
		}

		public init(from decoder: any Decoder) throws {
			let container = try decoder.container(keyedBy: CodingKeys.self)

			let nsid = try container.decode(String.self, forKey: .type)
			switch nsid {
			case "app.bsky.feed.defs#postView":
				self = try .postView(App.Bsky.Feed.Defs.PostView(from: decoder))
			default:
				print("BSKY unhandled nsid:", nsid, decoder.codingPath)
				self = .unhandled(nsid)
			}
		}

		public func encode(to encoder: any Encoder) throws {
			fatalError()
		}

	}

	public typealias ParentUnion = RootUnion
}
