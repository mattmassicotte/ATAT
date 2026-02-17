extension App.Bsky.Embed {
	public enum External: Codable, Hashable, Sendable {
		public static let nsid = "app.bsky.embed.external"

		case view(App.Bsky.Embed.External.View)
		case viewExternal(App.Bsky.Embed.External.ViewExternal)
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
			case App.Bsky.Embed.External.ViewExternal.nsid:
				self = .viewExternal(try ViewExternal(from: decoder))
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

extension App.Bsky.Embed.External {
	public struct View: Codable, Hashable, Sendable {
		public static let nsid = "app.bsky.embed.external#view"

		public let external: ViewExternal
	}
}

extension App.Bsky.Embed.External {
	public struct ViewExternal: Codable, Hashable, Sendable {
		public static let nsid = "app.bsky.embed.external#viewExternal"

		public let uri: ATProtoURI
		public let title: String
		public let description: String
		public let thumb: ATProtoURI?
	}
}

