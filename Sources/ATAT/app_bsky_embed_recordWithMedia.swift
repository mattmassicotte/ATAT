extension App.Bsky.Embed {
	public struct RecordWithMedia: Codable, Hashable, Sendable {
		public static let nsid = "app.bsky.embed.recordWithMedia"

		public let record: App.Bsky.Embed.Record
		public let media: MainUnion
	}
}

extension App.Bsky.Embed.RecordWithMedia {
	public enum MainUnion: Codable, Hashable, Sendable {
		case images(App.Bsky.Embed.Images)
		case video
		case external
		case unhandled(String)

		private enum CodingKeys: String, CodingKey {
			case type = "$type"
		}

		public init(from decoder: any Decoder) throws {
			let container = try decoder.container(keyedBy: CodingKeys.self)

			let nsid = try container.decode(String.self, forKey: .type)
			switch nsid {
			case "app.bsky.embed.images":
				self = try .images(App.Bsky.Embed.Images(from: decoder))
			default:
				print("BSKY unhandled nsid:", nsid, decoder.codingPath)
				self = .unhandled(nsid)
			}
		}

		public func encode(to encoder: any Encoder) throws {
			fatalError()
		}
	}
}

extension App.Bsky.Embed.RecordWithMedia {
	public struct View: Codable, Hashable, Sendable {
		public let record: App.Bsky.Embed.Record.View
		public let media: MediaUnion
	}
}

extension App.Bsky.Embed.RecordWithMedia.View {
	public enum MediaUnion: Codable, Hashable, Sendable {
		case imagesView(App.Bsky.Embed.Images.View)
		case videoView
		case externalView
		case unhandled(String)

		private enum CodingKeys: String, CodingKey {
			case type = "$type"
		}

		public init(from decoder: any Decoder) throws {
			let container = try decoder.container(keyedBy: CodingKeys.self)

			let nsid = try container.decode(String.self, forKey: .type)
			switch nsid {
			case "app.bsky.embed.images#view":
				self = try .imagesView(App.Bsky.Embed.Images.View(from: decoder))
			default:
				print("BSKY unhandled nsid:", nsid, decoder.codingPath)
				self = .unhandled(nsid)
			}
		}

		public func encode(to encoder: any Encoder) throws {
			fatalError()
		}
	}
}
