extension App.Bsky.Feed {
	public struct GetFeed {
		public struct Output: Codable, Hashable, Sendable {
			public let cursor: String?
			public let feed: [App.Bsky.Feed.Defs.FeedViewPost]
		}
	}
}
