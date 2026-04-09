import Foundation
import Testing
import ATAT

struct RepoTests {
	@Test func listReposOutput() throws {
		let profile = App.Bsky.Actor.Profile(
			displayName: "Massimo Pacoli",
			description: "Renounded Egyptologist",
			createdAt: Date()
		)

#if CIDCoding
		let cid = try ATProtoCID(data: Data("mycid".utf8))
#else
		let cid = try ATProtoCID("mycid")
#endif

		let output = Com.ATProto.Repo.ListRecords.Output(
			cursor: "mycursor",
			records: [
				.init(
					uri: "at://myuri",
					cid: cid,
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
