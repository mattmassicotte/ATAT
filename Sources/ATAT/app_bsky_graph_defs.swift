import Foundation

extension App.Bsky.Graph {
	public struct Defs {
		public static let nsid = "app.bsky.graph.defs"
	}
}

extension App.Bsky.Graph.Defs {
	public struct StarterPackViewBasic: Codable, Hashable, Sendable {
		public static let nsid = "\(App.Bsky.Graph.Defs.nsid)#starterPackViewBasic"

		public let uri: ATProtoURI
		public let cid: ATProtoCID
		public let record: UnknownRecord
		public let creator: App.Bsky.Actor.Defs.ProfileViewBasic
		public let listItemCount: Int?
		public let joinedWeekCount: Int?
		public let joinedAllTimeCount: Int?
		// labels
		public let indexedAt: Date
	}
}
