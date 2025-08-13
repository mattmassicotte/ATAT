public struct Bsky {
	public struct Feed {
	}
	
	public struct Embed {
	}
	
	public struct Blob: Codable, Hashable, Sendable {
		public let mimeType: String
		public let size: Int
	}
	
	public struct Actor {
	}
	
	public struct Repo {
	}
	
	public enum NSID: String, Codable, Hashable, Sendable {
		case embedExternal = "app.bsky.embed.external"
		case embedImages = "app.bsky.embed.images"
		case embedRecord  = "app.bsky.embed.record"
		case embedRecordWithMedia = "app.bsky.embed.recordWithMedia"
		case feedLike 		= "app.bsky.feed.like"
		case feedPost 		= "app.bsky.feed.post"
		case feedTimeline 	= "app.bsky.feed.getTimeline"
	}
}

public typealias ATProtoDID = String
public typealias ATProtoURI = String
public typealias ATProtoCID = String

