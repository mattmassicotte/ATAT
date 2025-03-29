extension Bsky.Repo {
	public struct CreateRecord {
	}
	
	public struct CommitMeta: Codable, Hashable, Sendable {
		public let cid: ATProtoCID
		public let rev: String
	}
	
	public struct StrongRef: Codable, Hashable, Sendable {
		public let cid: ATProtoCID
		public let type: String = "com.atproto.repo.strongRef"
		public let uri: ATProtoURI
		
		enum CodingKeys: CodingKey {
			case cid
			case uri
		}
		
		public init(cid: ATProtoCID, uri: ATProtoURI) {
			self.cid = cid
			self.uri = uri
		}
	}
}

extension Bsky.Repo.CreateRecord {
	public struct Request: Codable, Hashable, Sendable {
		public let repo: String
		public let rkey: String?
		public let validate: Bool?
		public let swapCommit: ATProtoCID?
		public let collection: Bsky.NSID
		public let record: GenericRecord
		
		public init(
			repo: String,
			rkey: String? = nil,
			validate: Bool? = nil,
			swapCommit: ATProtoCID? = nil,
			collection: Bsky.NSID,
			record: GenericRecord
		) {
			self.repo = repo
			self.rkey = rkey
			self.validate = validate
			self.swapCommit = swapCommit
			self.collection = collection
			self.record = record
		}
	}
	
	public struct Response: Codable, Hashable, Sendable {
		public let uri: ATProtoURI
		public let cid: ATProtoCID
		public let commit: Bsky.Repo.CommitMeta?
		public let validationStatus: String?
	}
}
