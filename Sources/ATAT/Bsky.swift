public struct Bsky {
	public struct Feed {
	}
	
	public struct Embed {
	}
	
	public struct Blob: Decodable, Hashable, Sendable {
		public let mimeType: String
		public let size: Int
	}
	
	public struct Actor {
	}
	
	public struct Repo {
	}
	
	public enum NSID: String, Codable, Hashable, Sendable {
		case feedLike 		= "app.bsky.feed.like"
		case feedPost 		= "app.bsky.feed.post"
		case feedTimeline 	= "app.bsky.feed.getTimeline"
	}
}

public typealias ATProtoDID = String
public typealias ATProtoURI = String
public typealias ATProtoCID = String

