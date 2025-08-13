import Foundation

extension Bsky.Feed.PostView {
	public var url: URL? {
		guard let rkey = uri.components(separatedBy: "/").last else {
			return nil
		}
		
		let handle = author.handle
		
		return URL(string: "https://bsky.app/profile/\(handle)/post/\(rkey)")
	}
	
	public var date: Date {
		guard case let .post(postRecord) = record else { return indexedAt }
		
		return postRecord.createdAt
	}

	// Helper function to parse URI into components
	func parseURI(_ uri: String) -> [String: String] {
		let components = uri
			.trimmingCharacters(in: .whitespacesAndNewlines)
			.split(separator: "/", omittingEmptySubsequences: false)
			.map { String($0) }

		guard components.count >= 5 else {
			return [:]
		}

		return [
			"repo": components[2],
			"collection": components[3],
			"rkey": components[4]
		]
	}
}

extension Bsky.Feed.FeedViewPost {
	public var reasonRepost: Bsky.Feed.ReasonRepost? {
		if case let .reasonRepost(value) = reason {
			return value
		}
		
		return nil
	}
}
