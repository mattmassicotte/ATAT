import Foundation

extension App.Bsky.Actor {
	public struct Defs {
	}
}

extension App.Bsky.Actor.Defs {
	public struct ProfileViewBasic: Codable, Hashable, Sendable {
		public let did: ATProtoDID
		public let handle: String
		public let displayName: String?
		public let avatar: String?
		public let createdAt: Date

		public var avatarURL: URL? {
			avatar.flatMap { URL(string: $0) }
		}

		public init(
			did: ATProtoDID,
			handle: String,
			displayName: String? = nil,
			avatar: String? = nil,
			createdAt: Date
		) {
			self.did = did
			self.handle = handle
			self.displayName = displayName
			self.avatar = avatar
			self.createdAt = createdAt
		}
	}
}
