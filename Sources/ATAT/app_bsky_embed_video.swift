extension App.Bsky.Embed {
	public enum Video: Codable, Hashable, Sendable {
		public static let nsid = "app.bsky.embed.video"

		case view(App.Bsky.Embed.Video.View)
		case unhandled(String)

		private enum CodingKeys: String, CodingKey {
			case type = "$type"
		}

		public init(from decoder: any Decoder) throws {
			let container = try decoder.container(keyedBy: CodingKeys.self)

//			if container.contains(.type) == false {
//				self = .main(try Main(from: decoder))
//				return
//			}

			let nsid = try container.decode(String.self, forKey: .type)
			switch nsid {
			case App.Bsky.Embed.External.View.nsid:
				self = .view(try View(from: decoder))
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

extension App.Bsky.Embed.Video {
	public struct View: Codable, Hashable, Sendable {
		public static let nsid = "\(App.Bsky.Embed.Video.nsid)#view"

		public let cid: ATProtoCID
	}
}
