import Foundation

extension App.Bsky.Actor {
	public struct Profile: Codable, Hashable, Sendable {
		public let createdAt: Date?
		public let description: String?
		public let displayName: String?
		public let pinnedPost: Com.ATProto.Repo.StrongRef?
		public let pronouns: String?
		public let website: String?

		public init(
			displayName: String,
			description: String,
			createdAt: Date,
			pronouns: String? = nil,
			website: String? = nil,
			pinnedPost: Com.ATProto.Repo.StrongRef? = nil
		) {
			self.displayName = displayName
			self.description = description
			self.createdAt = createdAt
			self.pronouns = pronouns
			self.website = website
			self.pinnedPost = pinnedPost
		}
	}
}
