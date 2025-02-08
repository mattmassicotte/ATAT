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
}

extension Bsky.Feed.FeedViewPost {
	public var reasonRepost: Bsky.Feed.ReasonRepost? {
		if case let .reasonRepost(value) = reason {
			return value
		}
		
		return nil
	}
}
