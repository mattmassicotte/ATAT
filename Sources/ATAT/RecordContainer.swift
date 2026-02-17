public struct RecordContainer<
	Record: Codable & Hashable & Sendable
>: Codable, Hashable, Sendable {
	public let record: Record
}
