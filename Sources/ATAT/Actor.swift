import Foundation

extension Bsky.Actor {
	public struct ViewerState: Codable, Hashable, Sendable {
		public let repost: ATProtoURI?
		public let like: ATProtoURI?
		public let muted: Bool?
		public let blockedBy: Bool?
		public let threadMuted: Bool?
		public let replyDisabled: Bool?
		public let embeddingDisabled: Bool?
		public let pinned: Bool?

		public init(
			repost: ATProtoURI?,
			like: ATProtoURI?,
			muted: Bool?,
			blockedBy: Bool?,
			threadMuted: Bool?,
			replyDisabled: Bool?,
			embeddingDisabled: Bool?,
			pinned: Bool?
		) {
			self.repost = repost
			self.like = like
			self.muted = muted
			self.blockedBy = blockedBy
			self.threadMuted = threadMuted
			self.replyDisabled = replyDisabled
			self.embeddingDisabled = embeddingDisabled
			self.pinned = pinned
		}
	}
	
	public struct ProfileViewBasic: Codable, Hashable, Sendable {
		public let did: ATProtoDID
		public let handle: String
		public let displayName: String?
		public let avatar: String?
		public let createdAt: Date
		public let viewer: ViewerState?
		
		public var avatarURL: URL? {
			avatar.flatMap { URL(string: $0) }
		}

		public init(
			did: ATProtoDID,
			handle: String,
			displayName: String? = nil,
			avatar: String? = nil,
			createdAt: Date,
			viewer: ViewerState? = nil
		) {
			self.did = did
			self.handle = handle
			self.displayName = displayName
			self.avatar = avatar
			self.createdAt = createdAt
			self.viewer = viewer
		}
	}
}
