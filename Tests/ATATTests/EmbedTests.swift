import Foundation
import Testing

import ATAT

struct EmbedTests {
	@Test func embedRecordViewWithMediaRecordView() throws {
let json = """
{"record":{"$type":"app.bsky.embed.record#viewRecord","uri":"at://did:plc:ab5inzxnpw4j2zvzlxupr5ut/app.bsky.feed.post/3lhnuqw5cms2h","cid":"bafyreibna5ivhju5fzk32x3hbkzbihut5vrazyn2kisi6q7yegtyxamqvi","author":{"did":"did:plc:ab5inzxnpw4j2zvzlxupr5ut","handle":"bpavuk.bsky.social","displayName":"Bohdan Pavuk","avatar":"https://cdn.bsky.app/img/avatar/plain/did:plc:ab5inzxnpw4j2zvzlxupr5ut/bafkreibx7jllyoabckrm3f7z5d2tctsbdd4xgnjuzm5ux73gk3zisnq3te@jpeg","associated":{"chat":{"allowIncoming":"all"}},"viewer":{"muted":false,"blockedBy":false},"labels":[],"createdAt":"2024-04-15T20:02:08.288Z"},"value":{"$type":"app.bsky.feed.post","createdAt":"2025-02-08T10:10:03.441Z","embed":{"$type":"app.bsky.embed.recordWithMedia","media":{"$type":"app.bsky.embed.images","images":[{"alt":"Bluesky Alt Text Rating - how many posts from the last 90 days contain alt text?\\nMu score is 92%","aspectRatio":{"height":2000,"width":972},"image":{"$type":"blob","ref":{"$link":"bafkreicjcy7iknl2tqviybl62yzvcfz7apwz7ft4neuilvsmd5pya747du"},"mimeType":"image/jpeg","size":256938}},{"alt":"Bluesky Alt Text Rating - how many posts you have ever posted contain alt text?\\nMy score is 74.49%","aspectRatio":{"height":2000,"width":972},"image":{"$type":"blob","ref":{"$link":"bafkreihfr6l6jqoel6dfywj5f6vtcefwijl2wqu77zup2tps76h3tip7re"},"mimeType":"image/jpeg","size":254119}}]},"record":{"$type":"app.bsky.embed.record","record":{"cid":"bafyreibza6aihtbew2oascknmknzajat7elrrgzztobm4gzvfjrr77erom","uri":"at://did:plc:g2nrqauct55qb6tcpepoo3dr/app.bsky.feed.post/3lhnqkp3a5c2h"}}},"facets":[{"features":[{"$type":"app.bsky.richtext.facet#link","uri":"https://dame.is/ratingalttext"}],"index":{"byteEnd":82,"byteStart":61}}],"langs":["en"],"text":"awesome rating, Dana!\\nand you, my reader, can check yours at dame.is/ratingalttext"},"labels":[],"likeCount":1,"replyCount":0,"repostCount":0,"quoteCount":1,"indexedAt":"2025-02-08T10:10:08.755Z","embeds":[{"$type":"app.bsky.embed.recordWithMedia#view","media":{"$type":"app.bsky.embed.images#view","images":[{"thumb":"https://cdn.bsky.app/img/feed_thumbnail/plain/did:plc:ab5inzxnpw4j2zvzlxupr5ut/bafkreicjcy7iknl2tqviybl62yzvcfz7apwz7ft4neuilvsmd5pya747du@jpeg","fullsize":"https://cdn.bsky.app/img/feed_fullsize/plain/did:plc:ab5inzxnpw4j2zvzlxupr5ut/bafkreicjcy7iknl2tqviybl62yzvcfz7apwz7ft4neuilvsmd5pya747du@jpeg","alt":"Bluesky Alt Text Rating - how many posts from the last 90 days contain alt text?\\nMu score is 92%","aspectRatio":{"height":2000,"width":972}},{"thumb":"https://cdn.bsky.app/img/feed_thumbnail/plain/did:plc:ab5inzxnpw4j2zvzlxupr5ut/bafkreihfr6l6jqoel6dfywj5f6vtcefwijl2wqu77zup2tps76h3tip7re@jpeg","fullsize":"https://cdn.bsky.app/img/feed_fullsize/plain/did:plc:ab5inzxnpw4j2zvzlxupr5ut/bafkreihfr6l6jqoel6dfywj5f6vtcefwijl2wqu77zup2tps76h3tip7re@jpeg","alt":"Bluesky Alt Text Rating - how many posts you have ever posted contain alt text?\\nMy score is 74.49%","aspectRatio":{"height":2000,"width":972}}]},"record":{"record":{"$type":"app.bsky.embed.record#viewRecord","uri":"at://did:plc:g2nrqauct55qb6tcpepoo3dr/app.bsky.feed.post/3lhnqkp3a5c2h","cid":"bafyreibza6aihtbew2oascknmknzajat7elrrgzztobm4gzvfjrr77erom","author":{"did":"did:plc:g2nrqauct55qb6tcpepoo3dr","handle":"danaenight.bsky.social","displayName":"Dana Nightingale","avatar":"https://cdn.bsky.app/img/avatar/plain/did:plc:g2nrqauct55qb6tcpepoo3dr/bafkreietdjqd4xkz6ap4qs7s3wniwaw3j33zvh2d6hpora7pwleieqosvq@jpeg","associated":{"chat":{"allowIncoming":"all"}},"viewer":{"muted":false,"blockedBy":false},"labels":[],"createdAt":"2023-06-26T19:02:39.021Z"},"value":{"$type":"app.bsky.feed.post","createdAt":"2025-02-08T08:54:59.793Z","embed":{"$type":"app.bsky.embed.recordWithMedia","media":{"$type":"app.bsky.embed.images","images":[{"alt":"My alt-text score is 97.06%. There's a radial meter with the needle deep in the green.","aspectRatio":{"height":229,"width":326},"image":{"$type":"blob","ref":{"$link":"bafkreigpvz3d2jh46oeadhlraczhz46kajrtsrztcekf44f7ih3amgziby"},"mimeType":"image/jpeg","size":31630}}]},"record":{"$type":"app.bsky.embed.record","record":{"cid":"bafyreiebyz62prxim6cgt6u2jy2odrpoo6phuhuk23fzq7uomrj6wf3n3m","uri":"at://did:plc:gq4fo3u6tqzzdkjlwzpb23tj/app.bsky.feed.post/3lft5dg5qgc2p"}}},"langs":["en"],"text":"Celebrating small victories. ✨"},"labels":[],"likeCount":8,"replyCount":1,"repostCount":0,"quoteCount":1,"indexedAt":"2025-02-08T08:55:00.951Z"}}}]}}
"""

		let view = try ATJSONDecoder().decode(App.Bsky.Embed.Record.View.self, from: Data(json.utf8))

		guard case let .viewRecord(viewRecord) = view.record else { Issue.record(); return }

		#expect(viewRecord.cid == "bafyreibna5ivhju5fzk32x3hbkzbihut5vrazyn2kisi6q7yegtyxamqvi")

		#expect(viewRecord.author.handle == "bpavuk.bsky.social")
		#expect(viewRecord.quoteCount == 1)
	}

	@Test func embedWithTypedRecord() throws {
		let json = """
{"$type":"app.bsky.embed.recordWithMedia","media":{"$type":"app.bsky.embed.images","images":[{"alt":"My alt-text score is 97.06%. There's a radial meter with the needle deep in the green.","aspectRatio":{"height":229,"width":326},"image":{"$type":"blob","ref":{"$link":"bafkreigpvz3d2jh46oeadhlraczhz46kajrtsrztcekf44f7ih3amgziby"},"mimeType":"image/jpeg","size":31630}}]},"record":{"$type":"app.bsky.embed.record","record":{"cid":"bafyreiebyz62prxim6cgt6u2jy2odrpoo6phuhuk23fzq7uomrj6wf3n3m","uri":"at://did:plc:gq4fo3u6tqzzdkjlwzpb23tj/app.bsky.feed.post/3lft5dg5qgc2p"}}}
"""

		let recordWithMedia = try ATJSONDecoder().decode(App.Bsky.Embed.RecordWithMedia.self, from: Data(json.utf8))

		guard case let .main(record) = recordWithMedia.record else { fatalError() }

		#expect(record.record.cid == "bafyreiebyz62prxim6cgt6u2jy2odrpoo6phuhuk23fzq7uomrj6wf3n3m")

		guard case let .images(.main(embedImages)) = recordWithMedia.media else { fatalError() }

		#expect(embedImages.images.count == 1)
		#expect(embedImages.images.first!.aspectRatio?.width == 326)
	}

	@Test func embedWithUntypedRecord() throws {
		let json = """
{"$type":"app.bsky.embed.recordWithMedia","media":{"$type":"app.bsky.embed.images","images":[{"alt":"Book cover of TCP/IP Illustrated, Volume 1: The Protocols by W. Richard Stevens. The design features a white background with a large red brushstroke, an illustration of the Earth with a rainbow-colored beam striking it, and a blue vertical band on the right labeled ‘Addison-Wesley Professional Computing Series.’","aspectRatio":{"height":1000,"width":791},"image":{"$type":"blob","ref":{"$link":"bafkreifw3d6344ahbfozamgoq6r6hxmz4sarzoyp6vaoz3bxqpwhkskidq"},"mimeType":"image/jpeg","size":157575}}]},"record":{"record":{"cid":"bafyreif2hzji4erumfu6himcwlmixmczi4iqusg6bc4s2u6iju44dgaglu","uri":"at://did:plc:67optetxjz7pqipfgts2vdi4/app.bsky.feed.post/3mdipe4p4ds2k"}}}
"""
		let recordWithMedia = try ATJSONDecoder().decode(App.Bsky.Embed.RecordWithMedia.self, from: Data(json.utf8))

		guard case let .main(record) = recordWithMedia.record else { fatalError() }

		#expect(record.record.cid == "bafyreif2hzji4erumfu6himcwlmixmczi4iqusg6bc4s2u6iju44dgaglu")
	}

	@Test
	func embedRecordViewStarterPack() throws {
		let json = """
{"$type":"app.bsky.embed.record#view","record":{"uri":"at://did:plc:g3cybquvoxmxto4lhtc2mdma/app.bsky.graph.starterpack/3l7edfblvuk2w","cid":"bafyreifp3ymohe47fa472dziy2yoss6xs7tf34rsnyhlockxcepj26knxu","record":{"$type":"app.bsky.graph.starterpack","createdAt":"2024-10-25T19:43:48.475Z","description":"News, science, essays, reviews, podcasts and radio, from publications that aren't owned and controlled by billionaires","feeds":[],"list":"at://did:plc:g3cybquvoxmxto4lhtc2mdma/app.bsky.graph.list/3l7edfbgyl724","name":"Independent, Worker-Owned and Reader-Funded Media","updatedAt":"2025-10-18T14:32:10.664Z"},"creator":{"did":"did:plc:g3cybquvoxmxto4lhtc2mdma","handle":"laminda.bsky.social","displayName":"Mindy Weisberger","avatar":"https://cdn.bsky.app/img/avatar/plain/did:plc:g3cybquvoxmxto4lhtc2mdma/bafkreighfqas3ex3widzog3u5aiaugzd6ch4yqciszn3agr3gk2nnmzpwm@jpeg","associated":{"chat":{"allowIncoming":"following"},"activitySubscription":{"allowSubscriptions":"followers"}},"viewer":{"muted":false,"blockedBy":false},"labels":[{"src":"did:plc:g3cybquvoxmxto4lhtc2mdma","uri":"at://did:plc:g3cybquvoxmxto4lhtc2mdma/app.bsky.actor.profile/self","cid":"bafyreiczilty4uqxgm7q4kyrqfoer7eebqejregq637mnjdbsmdvippidi","val":"!no-unauthenticated","cts":"1970-01-01T00:00:00.000Z"}],"createdAt":"2023-05-11T15:19:35.242Z"},"joinedAllTimeCount":109,"joinedWeekCount":0,"labels":[],"indexedAt":"2025-10-18T14:32:10.991Z","$type":"app.bsky.graph.defs#starterPackViewBasic"}}   
"""

		let record = try ATJSONDecoder().decode(App.Bsky.Embed.Record.self, from: Data(json.utf8))

		guard case let .view(view) = record else { Issue.record(); return }

		guard case let .starterBackViewBasic(starterPackView) = view.record else { Issue.record(); return }

		#expect(starterPackView.cid == "bafyreifp3ymohe47fa472dziy2yoss6xs7tf34rsnyhlockxcepj26knxu")
	}
}
