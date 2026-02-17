import Foundation

extension App.Bsky.Feed {
	public struct Post: Codable, Hashable, Sendable {
		public static let nsid = "app.bsky.feed.post"
		
		public let createdAt: Date
		public let langs: [String]?
		public let text: String
	}
}
