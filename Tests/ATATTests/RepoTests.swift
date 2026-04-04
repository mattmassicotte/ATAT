import Foundation
import Testing
import ATAT

struct RepoTests {
	@Test func listReposOutput() throws {
		let profile = App.Bsky.Actor.Profile(
			displayName: "Massimo Pacoli",
			description: "Renounded Egyptologist",
			createdAt: Date.now
		)

		let output = Com.ATProto.Repo.ListRecords.Output(
			cursor: "mycursor",
			records: [
				.init(
					uri: "at://myuri",
					cid: "mycid",
					value: .profile(profile)
				)
			]
		)

		let data = try ATJSONEncoder().encode(output)

		let decoded = try ATJSONDecoder().decode(Com.ATProto.Repo.ListRecords.Output.self, from: data)

		#expect(decoded.cursor == "mycursor")

		guard case let .profile(decodedProfile) = decoded.records.first?.value else { fatalError() }

		#expect(decodedProfile.displayName == "Massimo Pacoli")
	}
}
