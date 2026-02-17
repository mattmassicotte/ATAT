//
//  app_bsky_embed_images.swift
//  ATAT
//
//  Created by Matthew Massicotte on 2026-02-09.
//

extension App.Bsky.Embed {
	public enum Images: Codable, Hashable, Sendable {
		case main(Main)
		case image(Image)
		case view(View)
		case viewImage(ViewImage)
		case unhandled(String)

		public static let nsid = "app.bsky.embed.images"
		private enum CodingKeys: String, CodingKey {
			case type = "$type"
		}

		public init(from decoder: any Decoder) throws {
			let container = try decoder.container(keyedBy: CodingKeys.self)

			if container.contains(.type) == false {
				self = .main(try Main(from: decoder))
				return
			}

			let nsid = try container.decode(String.self, forKey: .type)
			switch nsid {
			case "app.bsky.embed.images":
				self = .main(try Main(from: decoder))
			case "app.bsky.embed.images#image":
				self = try .image(App.Bsky.Embed.Images.Image(from: decoder))
			case "app.bsky.embed.images#view":
				self = try .view(App.Bsky.Embed.Images.View(from: decoder))
			case "app.bsky.embed.images#viewImage":
				self = try .viewImage(App.Bsky.Embed.Images.ViewImage(from: decoder))
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

extension App.Bsky.Embed.Images {
	public struct Main: Codable, Hashable, Sendable {
		public let images: [App.Bsky.Embed.Images.Image]
	}
}

extension App.Bsky.Embed.Images {
	public struct Image: Codable, Hashable, Sendable {
		public let alt: String
		public let aspectRatio: App.Bsky.Embed.Defs.AspectRatio?
	}
}

extension App.Bsky.Embed.Images {
	public struct View: Codable, Hashable, Sendable {
		public let images: [App.Bsky.Embed.Images.ViewImage]
	}
}

extension App.Bsky.Embed.Images {
	public struct ViewImage: Codable, Hashable, Sendable {
		public let thumb: ATProtoURI
		public let fullsize: ATProtoURI
		public let alt: String?
		public let aspectRatio: App.Bsky.Embed.Defs.AspectRatio?
	}
}
