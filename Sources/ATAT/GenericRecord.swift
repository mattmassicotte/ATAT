public enum GenericRecord: Codable, Hashable, Sendable {
	private enum CodingKeys: String, CodingKey {
		case type = "$type"
	}
	
	indirect case post(Bsky.Feed.Post)
	case feedLike(Bsky.Feed.Like)
	indirect case embedRecord(Bsky.Embed.Record)
	indirect case embedRecordView(Bsky.Embed.Record.View)
	indirect case embedRecordViewRecord(Bsky.Embed.Record.ViewRecord)
	indirect case embedRecordWithMedia(Bsky.Embed.RecordWithMedia)
	indirect case embedRecordWithMediaView(Bsky.Embed.RecordWithMedia.View)
	case embedVideo(Bsky.Embed.Video)
	case embedVideoView(Bsky.Embed.Video.View)
	indirect case external(Bsky.Embed.External)
	case externalView(Bsky.Embed.External.View)
	case reasonRepost(Bsky.Feed.ReasonRepost)
	case images(Bsky.Embed.Images)
	case imagesView(Bsky.Embed.Images.View)
	case unhandled(String)

	public init(from decoder: any Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		let value = try container.decode(String.self, forKey: .type)
		
		switch value {
		case Bsky.NSID.feedPost.rawValue:
			self = .post(try Bsky.Feed.Post(from: decoder))
		case "app.bsky.embed.record#view":
			self = .embedRecordView(try Bsky.Embed.Record.View(from: decoder))
		case Bsky.NSID.embedRecord.rawValue:
			self = .embedRecord(try Bsky.Embed.Record(from: decoder))
		case "app.bsky.embed.record#viewRecord":
			self = .embedRecordViewRecord(try Bsky.Embed.Record.ViewRecord(from: decoder))
		case Bsky.NSID.embedExternal.rawValue:
			self = .external(try Bsky.Embed.External(from: decoder))
		case "app.bsky.embed.external#view":
			self = .externalView(try Bsky.Embed.External.View(from: decoder))
		case "app.bsky.feed.defs#reasonRepost":
			self = .reasonRepost(try Bsky.Feed.ReasonRepost(from: decoder))
		case Bsky.NSID.embedImages.rawValue:
			self = .images(try Bsky.Embed.Images(from: decoder))
		case "app.bsky.embed.images#view":
			self = .imagesView(try Bsky.Embed.Images.View(from: decoder))
		case Bsky.NSID.embedRecordWithMedia.rawValue:
			self = .embedRecordWithMedia(try Bsky.Embed.RecordWithMedia(from: decoder))
		case "app.bsky.embed.recordWithMedia#view":
			self = .embedRecordWithMediaView(try Bsky.Embed.RecordWithMedia.View(from: decoder))
		case "app.bsky.embed.video":
			self = .embedVideo(try Bsky.Embed.Video(from: decoder))
		case "app.bsky.embed.video#view":
			self = .embedVideoView(try Bsky.Embed.Video.View(from: decoder))
		default:
			print("unhandled record type: \(value)")
			self = .unhandled(value)
		}
	}
	
	public func encode(to encoder: any Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)

		switch self {
		case let .external(value):
			try container.encode(Bsky.NSID.embedExternal.rawValue, forKey: .type)

			try value.encode(to: encoder)
		case let .images(value):
			try container.encode(Bsky.NSID.embedImages.rawValue, forKey: .type)

			try value.encode(to: encoder)
		case let .embedRecord(value):
			try container.encode(Bsky.NSID.embedRecord.rawValue, forKey: .type)

			try value.encode(to: encoder)
		case let .embedRecordWithMedia(value):
			try container.encode(Bsky.NSID.embedRecordWithMedia.rawValue, forKey: .type)

			try value.encode(to: encoder)
		case let .feedLike(value):
			try container.encode(Bsky.NSID.feedLike.rawValue, forKey: .type)
			
			try value.encode(to: encoder)
		default:
			print("unhandled record type: \(self)")
		}
	}
}
