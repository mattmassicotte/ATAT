extension Com.ATProto.Repo {
	public struct ListRecords {
		public struct Output: Codable, Hashable, Sendable {
			public let cursor: String?
			public let records: [Record]

			public init(cursor: String?, records: [Record]) {
				self.cursor = cursor
				self.records = records
			}
		}

		public struct Record: Codable, Hashable, Sendable {
			public let uri: ATProtoURI
			public let cid: ATProtoCID
			public let value: UnknownRecord

			public init(uri: ATProtoURI, cid: ATProtoCID, value: UnknownRecord) {
				self.uri = uri
				self.cid = cid
				self.value = value
			}
		}
	}
}

