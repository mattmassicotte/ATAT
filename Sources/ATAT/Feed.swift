import Foundation

extension Bsky.Feed {
	public struct Reply: Decodable, Hashable, Sendable {
		public let grandparentAuthor: Bsky.Actor.ProfileViewBasic?
	}
}

extension Bsky.Feed {
	public struct FeedViewPost: Decodable, Hashable, Sendable {
		public let post: Bsky.Feed.PostView
		public let reply: Reply?
		public let reason: GenericRecord?
		public let feedContext: String?
	}
}

extension Bsky.Feed {
	public struct Post: Decodable, Hashable, Sendable {
		public let createdAt: Date
		public let langs: [String]?
		public let text: String
		public let embed: GenericRecord?
	}
}

extension Bsky.Feed {
	public struct PostView: Decodable, Hashable, Sendable {
		public let uri: ATProtoURI
		public let cid: ATProtoCID
		public let author: Bsky.Actor.ProfileViewBasic
		public let record: GenericRecord
		public let embed: GenericRecord?
		public let replyCount: Int
		public let repostCount: Int
		public let likeCount: Int
		public let quoteCount: Int
		public let indexedAt: Date
		public let viewer: Bsky.Actor.ViewerState
	}
}

extension Bsky.Feed {
	public struct ReasonRepost: Decodable, Hashable, Sendable {
		public let by: Bsky.Actor.ProfileViewBasic
		public let indexedAt: Date
	}
}

extension Bsky.Feed {
	public struct GetFeedResponse: Decodable, Hashable, Sendable {
		public let cursor: String?
		public let feed: [Bsky.Feed.FeedViewPost]
	}
}
