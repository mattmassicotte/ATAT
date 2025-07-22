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
	public struct Post: Codable, Hashable, Sendable {
		public struct ReplyReference: Codable, Hashable, Sendable {
			public let parent: Bsky.Repo.StrongRef
			public let root: Bsky.Repo.StrongRef

			public init(parent: Bsky.Repo.StrongRef, root: Bsky.Repo.StrongRef) {
				self.parent = parent
				self.root = root
			}
		}

		public let createdAt: Date
		public let langs: [String]?
		public let text: String
		public let embed: GenericRecord?
		public let reply: ReplyReference?

		public init(
			createdAt: Date,
			langs: [String]?,
			text: String,
			embed: GenericRecord?,
			reply: ReplyReference? = nil
		) {
			self.createdAt = createdAt
			self.langs = langs
			self.text = text
			self.embed = embed
			self.reply = reply
		}
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
		public let viewer: Bsky.Actor.ViewerState?

		public init(
			uri: ATProtoURI,
			cid: ATProtoCID,
			author: Bsky.Actor.ProfileViewBasic,
			record: GenericRecord,
			embed: GenericRecord?,
			replyCount: Int,
			repostCount: Int,
			likeCount: Int,
			quoteCount: Int,
			indexedAt: Date,
			viewer: Bsky.Actor.ViewerState?
		) {
			self.uri = uri
			self.cid = cid
			self.author = author
			self.record = record
			self.embed = embed
			self.replyCount = replyCount
			self.repostCount = repostCount
			self.likeCount = likeCount
			self.quoteCount = quoteCount
			self.indexedAt = indexedAt
			self.viewer = viewer
		}
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

extension Bsky.Feed {
	public struct Like: Codable, Hashable, Sendable {
		public let createdAt: Date
		public let subject: Bsky.Repo.StrongRef
		
		public init(createdAt: Date, subject: Bsky.Repo.StrongRef) {
			self.createdAt = createdAt
			self.subject = subject
		}
	}
}
