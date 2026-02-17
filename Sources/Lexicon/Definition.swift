public struct Definition: Hashable, Sendable {
	public let version: Int
	public let id: String
	public let description: String?
}

extension Definition: Identifiable {}

extension Definition: Codable {
	enum CodingKeys: String, CodingKey {
		case version = "lexicon"
		case id
		case description
	}
}

public struct DefinitionEntry: Hashable, Sendable {

}

extension DefinitionEntry: Codable {}
