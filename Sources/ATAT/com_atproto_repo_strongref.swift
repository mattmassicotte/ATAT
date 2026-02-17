extension Com.ATProto.Repo {
	public struct StrongRef: Codable, Hashable, Sendable {
		public let uri: ATProtoURI
		public let cid: ATProtoCID
	}
}
