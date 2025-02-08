import Foundation

extension Bsky.Embed {
	public struct Record: Decodable, Hashable, Sendable {
		public struct RecordField: Decodable, Hashable, Sendable {
			public let uri: ATProtoURI
			public let cid: ATProtoCID
		}
		
		public let record: RecordField
	}
}

extension Bsky.Embed.Record {
	public struct View: Decodable, Hashable, Sendable {
		public let record: GenericRecord
	}
}

extension Bsky.Embed.Record {
	public struct ViewRecord: Decodable, Hashable, Sendable {
		public let uri: ATProtoURI
		public let cid: ATProtoCID
		public let author: Bsky.Actor.ProfileViewBasic
		public let value: GenericRecord
		public let likeCount: Int
		public let replyCount: Int
		public let repostCount: Int
		public let quoteCount: Int
		public let indexedAt: Date
		public let embeds: [GenericRecord]?
	}
}

extension Bsky.Embed {
	public struct RecordWithMedia: Decodable, Hashable, Sendable {
		public let media: GenericRecord
		public let record: GenericRecord
	}
}

extension Bsky.Embed.RecordWithMedia {
	public struct View: Decodable, Hashable, Sendable {
		public struct RecordField: Decodable, Hashable, Sendable {
			public let record: GenericRecord
		}
		
		public let media: GenericRecord
		public let record: RecordField
	}
}

extension Bsky.Embed {
	public struct External: Decodable, Hashable, Sendable {
		public struct ExternalField: Decodable, Hashable, Sendable {
			public let description: String
			public let title: String
			public let uri: String
			public let thumb: Bsky.Blob?
		}
		
		public let external: ExternalField
	}
}

extension Bsky.Embed.External {
	public struct View: Decodable, Hashable, Sendable {
		public struct ExternalField: Decodable, Hashable, Sendable {
			public let description: String
			public let title: String
			public let uri: String
			public let thumb: String?
		}
		
		public let external: ExternalField
	}
}

extension Bsky.Embed {
	public struct AspectRatio: Decodable, Hashable, Sendable {
		public let height: Int
		public let width: Int
	}
}

extension Bsky.Embed {
	public struct Images: Decodable, Hashable, Sendable {
		public struct Image: Decodable, Hashable, Sendable {
			public let alt: String
			public let aspectRatio: AspectRatio
			public let image: Bsky.Blob
		}
		
		public let images: [Image]
	}
}

extension Bsky.Embed.Images {
	public struct ViewImage: Decodable, Hashable, Sendable {
		public let alt: String
		public let aspectRatio: Bsky.Embed.AspectRatio
		public let fullsize: String
		public let thumb: String
	}
	
	public struct View: Decodable, Hashable, Sendable {
		public let images: [ViewImage]
	}
}

extension Bsky.Embed {
	public struct Video: Decodable, Hashable, Sendable {
		public let aspectRatio: Bsky.Embed.AspectRatio
		public let video: Bsky.Blob
	}
}

extension Bsky.Embed.Video {
	public struct View: Decodable, Hashable, Sendable {
		public let cid: ATProtoCID
		public let playlist: String
		public let thumbnail: String
		public let aspectRatio: Bsky.Embed.AspectRatio
	}
}
