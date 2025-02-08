import Foundation

extension Bsky.Actor {
	public struct ViewerState: Decodable, Hashable, Sendable {
		public let repost: ATProtoURI?
		public let like: ATProtoURI?
		public let muted: Bool?
		public let blockedBy: Bool?
		public let threadMuted: Bool?
		public let replyDisabled: Bool?
		public let embeddingDisabled: Bool?
		public let pinned: Bool?
	}
	
	public struct ProfileViewBasic: Decodable, Hashable, Sendable {
		public let did: ATProtoDID
		public let handle: String
		public let displayName: String?
		public let avatar: String?
		public let createdAt: Date
		public let viewer: ViewerState?
		
		public var avatarURL: URL? {
			avatar.flatMap { URL(string: $0) }
		}
	}
}
