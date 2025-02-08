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
}

public typealias ATProtoDID = String
public typealias ATProtoURI = String
public typealias ATProtoCID = String
