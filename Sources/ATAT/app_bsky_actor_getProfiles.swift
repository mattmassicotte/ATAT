extension App.Bsky.Actor {
	public struct GetProfiles {
		public struct Output: Codable, Hashable, Sendable {
			public let profiles: [App.Bsky.Actor.Defs.ProfileViewDetailed]

			public init(profiles: [App.Bsky.Actor.Defs.ProfileViewDetailed]) {
				self.profiles = profiles
			}
		}
	}
}
