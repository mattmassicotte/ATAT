import Foundation
import Testing
import ATAT

struct PostTests {
	@Test
	func repost() throws {
		let json = """
 {"post":{"uri":"at://did:plc:niay7ajcptgklwrhknvnhk44/app.bsky.feed.post/3lhjnkjle5s2o","cid":"bafyreiaicb72bvulmvdafwzock4lsvarcx4bp54u4dri4jcrkjly5o5dla","author":{"did":"did:plc:niay7ajcptgklwrhknvnhk44","handle":"theferrarilab.bsky.social","displayName":"The Ferrari Lab","avatar":"https://cdn.bsky.app/img/avatar/plain/did:plc:niay7ajcptgklwrhknvnhk44/bafkreigtm5lw5smbvpisds2ozcrk7vovmp47jxkp5yi5en7ftdzxl5aqpy@jpeg","viewer":{"muted":false,"blockedBy":false},"labels":[],"createdAt":"2023-07-29T01:17:56.883Z"},"record":{"$type":"app.bsky.feed.post","createdAt":"2025-02-06T17:50:33.851Z","embed":{"$type":"app.bsky.embed.record","record":{"cid":"bafyreibox6hwfri43nvhrpmi4sznpzhpy3rvxr4pgkf6z6rtttjyiq27ua","uri":"at://did:plc:k5nskatzhyxersjilvtnz4lh/app.bsky.feed.post/3lhjg47rc6c2o"}},"langs":["en"],"text":"Rule 2. If you ever find yourself in a bar fight and someone wants to join in on your side, don't bring up old s**t until the fight is over. \\n\\nRule 1. Know when you are in a bar fight.\\n\\nWelcome to the fight, farmers."},"embed":{"$type":"app.bsky.embed.record#view","record":{"$type":"app.bsky.embed.record#viewRecord","uri":"at://did:plc:k5nskatzhyxersjilvtnz4lh/app.bsky.feed.post/3lhjg47rc6c2o","cid":"bafyreibox6hwfri43nvhrpmi4sznpzhpy3rvxr4pgkf6z6rtttjyiq27ua","author":{"did":"did:plc:k5nskatzhyxersjilvtnz4lh","handle":"washingtonpost.com","displayName":"The Washington Post","avatar":"https://cdn.bsky.app/img/avatar/plain/did:plc:k5nskatzhyxersjilvtnz4lh/bafkreicx5ybi5wukvetsv3m74z3nmvbvrdhgms6sr4nlilrktv5u2lmsay@jpeg","associated":{"chat":{"allowIncoming":"following"}},"viewer":{"muted":false,"blockedBy":false},"labels":[],"createdAt":"2023-05-01T18:57:05.658Z"},"value":{"$type":"app.bsky.feed.post","createdAt":"2025-02-06T15:37:17.606Z","embed":{"$type":"app.bsky.embed.external","external":{"description":"U.S. businesses that sold goods and services to USAID are in limbo, including American farms dealing in rice, wheat and soybeans.","thumb":{"$type":"blob","ref":{"$link":"bafkreidkonskmf77ctno6ilvuxdkzeffichjfk65ycwawtm2qeecyz3hxe"},"mimeType":"image/jpeg","size":313186},"title":"Gutting USAID threatens billions of dollars for U.S. farms, businesses","uri":"https://www.washingtonpost.com/politics/2025/02/06/trump-usaid-money-american-farms/?utm_campaign=wp_main&utm_medium=social&utm_source=bluesky"}},"langs":["en"],"text":"U.S. businesses that sold goods and services to USAID are in limbo, including American farms dealing in rice, wheat and soybeans purchased as food aid."},"labels":[],"likeCount":1700,"replyCount":193,"repostCount":722,"quoteCount":217,"indexedAt":"2025-02-06T15:37:19.452Z","embeds":[{"$type":"app.bsky.embed.external#view","external":{"uri":"https://www.washingtonpost.com/politics/2025/02/06/trump-usaid-money-american-farms/?utm_campaign=wp_main&utm_medium=social&utm_source=bluesky","title":"Gutting USAID threatens billions of dollars for U.S. farms, businesses","description":"U.S. businesses that sold goods and services to USAID are in limbo, including American farms dealing in rice, wheat and soybeans.","thumb":"https://cdn.bsky.app/img/feed_thumbnail/plain/did:plc:k5nskatzhyxersjilvtnz4lh/bafkreidkonskmf77ctno6ilvuxdkzeffichjfk65ycwawtm2qeecyz3hxe@jpeg"}}]}},"replyCount":1,"repostCount":7,"likeCount":9,"quoteCount":0,"indexedAt":"2025-02-06T17:50:34.148Z","viewer":{"threadMuted":false,"embeddingDisabled":false},"labels":[]},"reason":{"$type":"app.bsky.feed.defs#reasonRepost","by":{"did":"did:plc:lw5dadzkguntwgkj2jxmulxk","handle":"daniloc.xyz","displayName":"Danilo 🇵🇷","avatar":"https://cdn.bsky.app/img/avatar/plain/did:plc:lw5dadzkguntwgkj2jxmulxk/bafkreibfpv3q3s3b5xmooejbb4aidx4litq4lzfueztlmfxku4minr7hu4@jpeg","viewer":{"muted":false,"blockedBy":false,"following":"at://did:plc:klsh7edzj3jmxucibyjqstb3/app.bsky.graph.follow/3lapa4bowrn2l","followedBy":"at://did:plc:lw5dadzkguntwgkj2jxmulxk/app.bsky.graph.follow/3lapa7cn4kw2a"},"labels":[],"createdAt":"2023-04-30T17:08:16.864Z"},"indexedAt":"2025-02-06T17:58:31.348Z"}}
 """

		let viewPost = try JSONDecoder.atJSONDecoder.decode(Bsky.Feed.FeedViewPost.self, from: Data(json.utf8))
		
		#expect(viewPost.post.author.handle == "theferrarilab.bsky.social")
		
		guard case let .reasonRepost(repost) = viewPost.reason else { fatalError() }

		#expect(repost.by.handle == "daniloc.xyz")
	}
	
	@Test func externalRepostWithComment() throws {
		let json = """
{"uri":"at://did:plc:oio4hkxaop4ao4wz2pp3f4cr/app.bsky.feed.post/3lhlu3l65522g","cid":"bafyreibrkxkacxatbzeotlniejtocbiiz5burtvvqtrsykmpim7sr7omhm","author":{"did":"did:plc:oio4hkxaop4ao4wz2pp3f4cr","handle":"mackuba.eu","displayName":"Kuba Suder 🇵🇱🇺🇦","avatar":"https://cdn.bsky.app/img/avatar/plain/did:plc:oio4hkxaop4ao4wz2pp3f4cr/bafkreicfcegl67gxxlqhbugnqqraqkgfcepp6jauzstex53yblyhn6f4p4@jpeg","associated":{"chat":{"allowIncoming":"all"}},"viewer":{"muted":false,"blockedBy":false,"following":"at://did:plc:klsh7edzj3jmxucibyjqstb3/app.bsky.graph.follow/3laovmbgn3c2w","followedBy":"at://did:plc:oio4hkxaop4ao4wz2pp3f4cr/app.bsky.graph.follow/3laoyalgzjb2m"},"labels":[],"createdAt":"2023-04-24T11:40:08.480Z"},"record":{"$type":"app.bsky.feed.post","createdAt":"2025-02-07T14:52:47.869Z","embed":{"$type":"app.bsky.embed.record","record":{"cid":"bafyreibuv5t2zkvf4wgstrhpvothxshkk26f7x3axhcwjii74a2g3acxuq","uri":"at://did:plc:7exlcsle4mjfhu3wnhcgizz6/app.bsky.feed.post/3lhljcua7lv2e"}},"langs":["en"],"text":"F this 😠"},"embed":{"$type":"app.bsky.embed.record#view","record":{"$type":"app.bsky.embed.record#viewRecord","uri":"at://did:plc:7exlcsle4mjfhu3wnhcgizz6/app.bsky.feed.post/3lhljcua7lv2e","cid":"bafyreibuv5t2zkvf4wgstrhpvothxshkk26f7x3axhcwjii74a2g3acxuq","author":{"did":"did:plc:7exlcsle4mjfhu3wnhcgizz6","handle":"theverge.com","displayName":"The Verge","avatar":"https://cdn.bsky.app/img/avatar/plain/did:plc:7exlcsle4mjfhu3wnhcgizz6/bafkreif54hai2n2elc7h6ka5qs4q2tbj5w3gh27s2z7c6nkh44kxt5nzhe@jpeg","viewer":{"muted":false,"blockedBy":false,"following":"at://did:plc:klsh7edzj3jmxucibyjqstb3/app.bsky.graph.follow/3laovgu3z622y"},"labels":[],"createdAt":"2023-05-23T19:11:25.009Z"},"value":{"$type":"app.bsky.feed.post","createdAt":"2025-02-07T11:40:00.636Z","embed":{"$type":"app.bsky.embed.external","external":{"description":"If implemented, the secret order would give the UK access to encrypted backups belonging to any user — not just Brits.","thumb":{"$type":"blob","ref":{"$link":"bafkreidqcvudgtorrjbaj4plxrybfkjosx5hxdpywxxhrkfrkpgbyhwl7u"},"mimeType":"image/jpeg","size":25507},"title":"Apple ordered to open encrypted user accounts globally to UK spying","uri":"https://buff.ly/4aMbXlX"}},"text":"Apple ordered to open encrypted user accounts globally to UK spying"},"labels":[],"likeCount":90,"replyCount":17,"repostCount":34,"quoteCount":33,"indexedAt":"2025-02-07T11:40:01.252Z","embeds":[{"$type":"app.bsky.embed.external#view","external":{"uri":"https://buff.ly/4aMbXlX","title":"Apple ordered to open encrypted user accounts globally to UK spying","description":"If implemented, the secret order would give the UK access to encrypted backups belonging to any user — not just Brits.","thumb":"https://cdn.bsky.app/img/feed_thumbnail/plain/did:plc:7exlcsle4mjfhu3wnhcgizz6/bafkreidqcvudgtorrjbaj4plxrybfkjosx5hxdpywxxhrkfrkpgbyhwl7u@jpeg"}}]}},"replyCount":1,"repostCount":0,"likeCount":3,"quoteCount":0,"indexedAt":"2025-02-07T14:52:48.253Z","viewer":{"threadMuted":false,"embeddingDisabled":false},"labels":[]}
"""
		
		let post = try JSONDecoder.atJSONDecoder.decode(Bsky.Feed.PostView.self, from: Data(json.utf8))
		
		#expect(post.author.handle == "mackuba.eu")
		#expect(post.author.displayName == "Kuba Suder 🇵🇱🇺🇦")
		#expect(post.author.avatar == "https://cdn.bsky.app/img/avatar/plain/did:plc:oio4hkxaop4ao4wz2pp3f4cr/bafkreicfcegl67gxxlqhbugnqqraqkgfcepp6jauzstex53yblyhn6f4p4@jpeg")
		#expect(post.author.viewer?.muted == false)
		#expect(post.author.viewer?.blockedBy == false)
		#expect(post.replyCount == 1)
		#expect(post.likeCount == 3)
		
		guard case let .post(postRecord) = post.record else { fatalError() }
		
		#expect(postRecord.text == "F this 😠")
		#expect(postRecord.createdAt.timeIntervalSince1970 == 1738939967.869)
		
		guard case let .embedRecordView(recordView) = post.embed else { fatalError() }
		guard case let .embedRecordViewRecord(viewRecord) = recordView.record else { fatalError() }
		
		#expect(viewRecord.cid == "bafyreibuv5t2zkvf4wgstrhpvothxshkk26f7x3axhcwjii74a2g3acxuq")
		#expect(viewRecord.author.handle == "theverge.com")
		
		guard case let .post(quotePost) = viewRecord.value else { fatalError() }
		
		#expect(quotePost.text == "Apple ordered to open encrypted user accounts globally to UK spying")
		
		guard case let .external(external) = quotePost.embed else { fatalError() }
		
		#expect(external.external.uri == "https://buff.ly/4aMbXlX")
		#expect(external.external.thumb?.size == 25507)
		
		#expect(viewRecord.embeds?.count == 1)
		let viewRecordEmbed = try #require(viewRecord.embeds?.first)
		
		guard case let .externalView(viewRecordEmbedExternal) = viewRecordEmbed else { fatalError() }
		
		#expect(viewRecordEmbedExternal.external.thumb == "https://cdn.bsky.app/img/feed_thumbnail/plain/did:plc:7exlcsle4mjfhu3wnhcgizz6/bafkreidqcvudgtorrjbaj4plxrybfkjosx5hxdpywxxhrkfrkpgbyhwl7u@jpeg")
	}
	
	@Test func externalEmbed() throws {
		let json = """
{"uri":"at://did:plc:a2xro4bckdu24pdxtevo7mmr/app.bsky.feed.post/3lhlr5a4shz2u","cid":"bafyreigzph7cpvkexofp4oixzbl4uwdblowzsb6ai66cdxggvqmblxxqci","author":{"did":"did:plc:a2xro4bckdu24pdxtevo7mmr","handle":"createwithswift.bsky.social","displayName":"Create with Swift","avatar":"https://cdn.bsky.app/img/avatar/plain/did:plc:a2xro4bckdu24pdxtevo7mmr/bafkreiedleudiwqwpb3xkzneajtuqovvsimnv4t2jxwpignefaijbhwtue@jpeg","viewer":{"muted":false,"blockedBy":false,"following":"at://did:plc:klsh7edzj3jmxucibyjqstb3/app.bsky.graph.follow/3lhdu77jt3d22","followedBy":"at://did:plc:a2xro4bckdu24pdxtevo7mmr/app.bsky.graph.follow/3lboriudggv23"},"labels":[],"createdAt":"2024-11-22T10:53:21.552Z"},"record":{"$type":"app.bsky.feed.post","createdAt":"2025-02-07T14:00:00.990Z","embed":{"$type":"app.bsky.embed.external","external":{"description":"Design thoughtfully for every app state, transforming potential user frustration into a seamless, engaging experience.","thumb":{"$type":"blob","ref":{"$link":"bafkreidro6ak2yxfghlmpejb5j7c2xexj24ddqfggbrrheiuzdqogjuljy"},"mimeType":"image/png","size":422102},"title":"Designing for Application States: Creating Seamless User Experiences","uri":"https://www.createwithswift.com/designing-for-application-states-creating-seamless-user-experiences/"}},"text":"A great user experience isn’t just about what users see—it’s about what they feel in every state. \\nFrom onboarding to errors, each moment matters. Don’t leave users guessing—design for every state. \\nFind out more with Giselle Katics:"},"embed":{"$type":"app.bsky.embed.external#view","external":{"uri":"https://www.createwithswift.com/designing-for-application-states-creating-seamless-user-experiences/","title":"Designing for Application States: Creating Seamless User Experiences","description":"Design thoughtfully for every app state, transforming potential user frustration into a seamless, engaging experience.","thumb":"https://cdn.bsky.app/img/feed_thumbnail/plain/did:plc:a2xro4bckdu24pdxtevo7mmr/bafkreidro6ak2yxfghlmpejb5j7c2xexj24ddqfggbrrheiuzdqogjuljy@jpeg"}},"replyCount":0,"repostCount":0,"likeCount":0,"quoteCount":0,"indexedAt":"2025-02-07T14:00:03.165Z","viewer":{"threadMuted":false,"embeddingDisabled":false},"labels":[]}
"""
		
		let post = try JSONDecoder.atJSONDecoder.decode(Bsky.Feed.PostView.self, from: Data(json.utf8))
		
		#expect(post.author.handle == "createwithswift.bsky.social")
		
		guard case let .externalView(externalView) = post.embed else { fatalError() }
		
		#expect(externalView.external.uri == "https://www.createwithswift.com/designing-for-application-states-creating-seamless-user-experiences/")
	}
	
	@Test func postWithoutEmbed() throws {
		let json = """
{"uri":"at://did:plc:yf6b2cgjhxo5wevddebvklna/app.bsky.feed.post/3lhmgh4f5es2q","cid":"bafyreiae5lo7dbspacvffwoqk4aiuxrh6ydzjhmcrc2mwn5i3ymjdlfc54","author":{"did":"did:plc:yf6b2cgjhxo5wevddebvklna","handle":"xxiainxx.bsky.social","displayName":"¡a!n","avatar":"https://cdn.bsky.app/img/avatar/plain/did:plc:yf6b2cgjhxo5wevddebvklna/bafkreifovdg7vb3d7rpe62vatqaw6ga6kokmtsnsz5peg4vzg4ndkcciji@jpeg","associated":{"chat":{"allowIncoming":"following"}},"viewer":{"muted":false,"blockedBy":false,"following":"at://did:plc:klsh7edzj3jmxucibyjqstb3/app.bsky.graph.follow/3ldwkn47ed627","followedBy":"at://did:plc:yf6b2cgjhxo5wevddebvklna/app.bsky.graph.follow/3ldwjhe5gr62c"},"labels":[{"src":"did:plc:yf6b2cgjhxo5wevddebvklna","uri":"at://did:plc:yf6b2cgjhxo5wevddebvklna/app.bsky.actor.profile/self","cid":"bafyreig7pwn46xttrw6yi23voj2ekv63mat3ovx27pxxubpa242wgccyoy","val":"!no-unauthenticated","cts":"1970-01-01T00:00:00.000Z"}],"createdAt":"2023-08-02T09:51:14.221Z"},"record":{"$type":"app.bsky.feed.post","createdAt":"2025-02-07T20:21:22.374Z","langs":["en"],"reply":{"parent":{"cid":"bafyreiby2uj6vzcxz2hwvhehmec7zretmxg7ioxuz4opczath2mi7do6x4","uri":"at://did:plc:x2rfmy3ldn2k6d2diyp7ofi2/app.bsky.feed.post/3lhmfcfualc2s"},"root":{"cid":"bafyreibgkzva4fazy6hjay44zurrkvowm2y7oj3fvoolcnzlwvkbzjna6q","uri":"at://did:plc:r6xugwwpp4ss5liddodf7thw/app.bsky.feed.post/3lhmf2be2rc2b"}},"text":"There's a Peter Kay impersonator at a hotel near me next month"},"replyCount":0,"repostCount":0,"likeCount":0,"quoteCount":0,"indexedAt":"2025-02-07T20:21:23.254Z","viewer":{"threadMuted":false,"embeddingDisabled":false},"labels":[]}
"""

		let post = try JSONDecoder.atJSONDecoder.decode(Bsky.Feed.PostView.self, from: Data(json.utf8))
		
		#expect(post.author.handle == "xxiainxx.bsky.social")
	}
	
	@Test func postWithImagesEmbed() throws {
		let json = """
{"uri":"at://did:plc:z7ja7uhcr5is6uqmnsjyn3k7/app.bsky.feed.post/3lhmggpkbw22v","cid":"bafyreiafygqmoa553i5bvt4d55axdvzbogsweh32t42atysw2fikpu7h3u","author":{"did":"did:plc:z7ja7uhcr5is6uqmnsjyn3k7","handle":"danoleary.bsky.social","displayName":"Dan O’Leary","avatar":"https://cdn.bsky.app/img/avatar/plain/did:plc:z7ja7uhcr5is6uqmnsjyn3k7/bafkreidmmpnj35xb52xhxa4mr2j24kbxg36pjtk2nyhwcjw4imhqxdx5ne@jpeg","viewer":{"muted":false,"blockedBy":false,"following":"at://did:plc:klsh7edzj3jmxucibyjqstb3/app.bsky.graph.follow/3laqljrcgfy2q","followedBy":"at://did:plc:z7ja7uhcr5is6uqmnsjyn3k7/app.bsky.graph.follow/3laq2jilw4n2r"},"labels":[{"src":"did:plc:z7ja7uhcr5is6uqmnsjyn3k7","uri":"at://did:plc:z7ja7uhcr5is6uqmnsjyn3k7/app.bsky.actor.profile/self","cid":"bafyreic6mp6qgcg5hlj7xktjroeamqbcrmgevyyofimrnymlistglynixm","val":"!no-unauthenticated","cts":"1970-01-01T00:00:00.000Z"}],"createdAt":"2023-08-29T02:01:50.860Z"},"record":{"$type":"app.bsky.feed.post","createdAt":"2025-02-07T20:21:08.906Z","embed":{"$type":"app.bsky.embed.images","images":[{"alt":"","aspectRatio":{"height":1500,"width":1999},"image":{"$type":"blob","ref":{"$link":"bafkreicjr5ezdgwv6z4zcxv2egqjmaox6ocplsrhvubmmfqyuh6dybhfma"},"mimeType":"image/jpeg","size":922545}}]},"langs":["en"],"text":"It was time to go M1 to M4"},"embed":{"$type":"app.bsky.embed.images#view","images":[{"thumb":"https://cdn.bsky.app/img/feed_thumbnail/plain/did:plc:z7ja7uhcr5is6uqmnsjyn3k7/bafkreicjr5ezdgwv6z4zcxv2egqjmaox6ocplsrhvubmmfqyuh6dybhfma@jpeg","fullsize":"https://cdn.bsky.app/img/feed_fullsize/plain/did:plc:z7ja7uhcr5is6uqmnsjyn3k7/bafkreicjr5ezdgwv6z4zcxv2egqjmaox6ocplsrhvubmmfqyuh6dybhfma@jpeg","alt":"","aspectRatio":{"height":1500,"width":1999}}]},"replyCount":0,"repostCount":0,"likeCount":0,"quoteCount":0,"indexedAt":"2025-02-07T20:21:11.468Z","viewer":{"threadMuted":false,"embeddingDisabled":false},"labels":[]}
"""

		let post = try JSONDecoder.atJSONDecoder.decode(Bsky.Feed.PostView.self, from: Data(json.utf8))
		
		#expect(post.author.handle == "danoleary.bsky.social")

		guard case let .post(postRecord) = post.record else { fatalError() }
		
		guard case let .images(images) = postRecord.embed else { fatalError() }
		
		#expect(images.images.count == 1)
		let image = try #require(images.images.first)
		let imageAspectRatio = try #require(image.aspectRatio)
		
		#expect(imageAspectRatio.height == 1500)
		#expect(imageAspectRatio.width == 1999)
		#expect(image.image.mimeType == "image/jpeg")
		#expect(image.image.size == 922545)
		
		guard case let .imagesView(imagesView) = post.embed else { fatalError() }
		
		#expect(imagesView.images.count == 1)
		let imageView = try #require(imagesView.images.first)
		let imageViewAspectRatio = try #require(imageView.aspectRatio)
		
		#expect(imageViewAspectRatio.height == 1500)
		#expect(imageViewAspectRatio.width == 1999)
		#expect(imageView.fullsize == "https://cdn.bsky.app/img/feed_fullsize/plain/did:plc:z7ja7uhcr5is6uqmnsjyn3k7/bafkreicjr5ezdgwv6z4zcxv2egqjmaox6ocplsrhvubmmfqyuh6dybhfma@jpeg")
	}
	
	@Test func postWithRecordEmbed() throws {
		let json = """
{"uri":"at://did:plc:grjqrmpcr7bcrwxmll7weidf/app.bsky.feed.post/3lhmjfkl44s2y","cid":"bafyreifmdnsgexpzgoty6t4ple7jrltiml6iznmir44rtr52wx3bobshz4","author":{"did":"did:plc:grjqrmpcr7bcrwxmll7weidf","handle":"launchedfm.com","displayName":"Launched","avatar":"https://cdn.bsky.app/img/avatar/plain/did:plc:grjqrmpcr7bcrwxmll7weidf/bafkreien5xdzefvizdnrt7gnl6lcdvlvnn6z72yjo5pcwrgodcynijsinm@jpeg","viewer":{"muted":false,"blockedBy":false},"labels":[],"createdAt":"2024-11-15T04:37:21.256Z"},"record":{"$type":"app.bsky.feed.post","createdAt":"2025-02-07T21:14:11.364Z","embed":{"$type":"app.bsky.embed.record","record":{"cid":"bafyreig57nn5tdtsgtr54frwotf3hqrriouikz7vv6v6ukjbsle3j55yzi","uri":"at://did:plc:6y3jllixhqf3vjupdvzdtxsf/app.bsky.feed.post/3lhmdqmtrj22m"}},"langs":["en"],"text":"Launched Live is back this year at Deep Dish Swift in Chicago! 🍕🍕🍕\\n\\nBut don’t worry, you won’t have to wait till April for more Launched… 👀"},"embed":{"$type":"app.bsky.embed.record#view","record":{"$type":"app.bsky.embed.record#viewRecord","uri":"at://did:plc:6y3jllixhqf3vjupdvzdtxsf/app.bsky.feed.post/3lhmdqmtrj22m","cid":"bafyreig57nn5tdtsgtr54frwotf3hqrriouikz7vv6v6ukjbsle3j55yzi","author":{"did":"did:plc:6y3jllixhqf3vjupdvzdtxsf","handle":"deepdishswift.com","displayName":"Deep Dish Swift 2025 • 4/27 to 4/29","avatar":"https://cdn.bsky.app/img/avatar/plain/did:plc:6y3jllixhqf3vjupdvzdtxsf/bafkreigar56aanjtf3fuz53hqls3ircaps6kg3lpl7ecogiwmrioq3u6k4@jpeg","viewer":{"muted":false,"blockedBy":false,"following":"at://did:plc:klsh7edzj3jmxucibyjqstb3/app.bsky.graph.follow/3lazobjyxga2i"},"labels":[],"createdAt":"2024-10-26T23:49:02.207Z"},"value":{"$type":"app.bsky.feed.post","createdAt":"2025-02-07T19:33:00.385Z","embed":{"$type":"app.bsky.embed.images","images":[{"alt":"","aspectRatio":{"height":676,"width":1089},"image":{"$type":"blob","ref":{"$link":"bafkreifl2ekavq2diky6z5cwtkadnrkslx7lzequr2t2fkgeoxe5syzwom"},"mimeType":"image/jpeg","size":851764}}]},"facets":[{"$type":"app.bsky.richtext.facet","features":[{"$type":"app.bsky.richtext.facet#mention","did":"did:plc:aglxlci7cqa7x5wqt2d2w2ai"}],"index":{"byteEnd":116,"byteStart":96}},{"$type":"app.bsky.richtext.facet","features":[{"$type":"app.bsky.richtext.facet#mention","did":"did:plc:tjdma6qyt2cyzztg2j5yofua"}],"index":{"byteEnd":198,"byteStart":181}},{"$type":"app.bsky.richtext.facet","features":[{"$type":"app.bsky.richtext.facet#mention","did":"did:plc:34y5wrg6qo7pjdtcpk7sahpc"}],"index":{"byteEnd":221,"byteStart":200}},{"$type":"app.bsky.richtext.facet","features":[{"$type":"app.bsky.richtext.facet#mention","did":"did:plc:r632gtijxu7rm7d47ma6mv7o"}],"index":{"byteEnd":253,"byteStart":227}},{"$type":"app.bsky.richtext.facet","features":[{"$type":"app.bsky.richtext.facet#mention","did":"did:plc:grjqrmpcr7bcrwxmll7weidf"}],"index":{"byteEnd":272,"byteStart":257}}],"langs":["en"],"text":"Y’all gave us some feedback last year...\\n\\n1️⃣ You wanted a live panel\\n2️⃣ You thought @charliemchapman.com didn't work hard enough\\n\\nWell... you got it!\\n\\nCharlie will host @ryanashcraft.com, @teamneem.bsky.social, and @edwardsanchez.bsky.social on @launchedfm.com  LIVE on stage 🎤🍕\\n\\nSee you on April 28th!"},"labels":[],"likeCount":5,"replyCount":1,"repostCount":1,"quoteCount":3,"indexedAt":"2025-02-07T19:33:03.250Z","embeds":[{"$type":"app.bsky.embed.images#view","images":[{"thumb":"https://cdn.bsky.app/img/feed_thumbnail/plain/did:plc:6y3jllixhqf3vjupdvzdtxsf/bafkreifl2ekavq2diky6z5cwtkadnrkslx7lzequr2t2fkgeoxe5syzwom@jpeg","fullsize":"https://cdn.bsky.app/img/feed_fullsize/plain/did:plc:6y3jllixhqf3vjupdvzdtxsf/bafkreifl2ekavq2diky6z5cwtkadnrkslx7lzequr2t2fkgeoxe5syzwom@jpeg","alt":"","aspectRatio":{"height":676,"width":1089}}]}]}},"replyCount":0,"repostCount":1,"likeCount":1,"quoteCount":0,"indexedAt":"2025-02-07T21:14:11.650Z","viewer":{"threadMuted":false,"embeddingDisabled":false},"labels":[]}
"""

		let post = try JSONDecoder.atJSONDecoder.decode(Bsky.Feed.PostView.self, from: Data(json.utf8))
		
		#expect(post.author.handle == "launchedfm.com")

		guard case let .post(postRecord) = post.record else { fatalError() }
		
		guard case let .embedRecord(embedRecord) = postRecord.embed else { fatalError() }
		
		#expect(embedRecord.record.cid == "bafyreig57nn5tdtsgtr54frwotf3hqrriouikz7vv6v6ukjbsle3j55yzi")
		
		guard case let .embedRecordView(recordView) = post.embed else { fatalError() }
		guard case let .embedRecordViewRecord(viewRecord) = recordView.record else { fatalError() }
		
		#expect(viewRecord.author.handle == "deepdishswift.com")
	}
	
	@Test func postWithMedia() throws {
		let json = """
{"uri":"at://did:plc:64fyz6rpsagabcfqzdxykwgg/app.bsky.feed.post/3lhnv26fdxc2v","cid":"bafyreih5nx5yz6bkglezsajuyaasu5wstlm2tck2xpoai5jk7rzm3xxtwq","author":{"did":"did:plc:64fyz6rpsagabcfqzdxykwgg","handle":"iamkonstantin.eu","displayName":"Konstantin 🔭","avatar":"https://cdn.bsky.app/img/avatar/plain/did:plc:64fyz6rpsagabcfqzdxykwgg/bafkreiabha35e4kpup6jyw5qxvoqovmqv2bdmzbfbz3herrboi26lv5aii@jpeg","associated":{"chat":{"allowIncoming":"all"}},"viewer":{"muted":false,"blockedBy":false,"following":"at://did:plc:klsh7edzj3jmxucibyjqstb3/app.bsky.graph.follow/3lb3wq7ehd62b","followedBy":"at://did:plc:64fyz6rpsagabcfqzdxykwgg/app.bsky.graph.follow/3lb3weldik424"},"labels":[],"createdAt":"2023-05-05T05:38:51.449Z"},"record":{"$type":"app.bsky.feed.post","createdAt":"2025-02-08T10:15:14.135Z","embed":{"$type":"app.bsky.embed.recordWithMedia","media":{"$type":"app.bsky.embed.images","images":[{"alt":"Bluesky Alt Text Rating\\nHow consistently do you use alt text?\\nMy score is 93%","aspectRatio":{"height":1238,"width":890},"image":{"$type":"blob","ref":{"$link":"bafkreibkxgznhp42mnr6dgxkfylsu53nkjlzte4mhmgvspx4ib55jfes3e"},"mimeType":"image/jpeg","size":176903}}]},"record":{"$type":"app.bsky.embed.record","record":{"cid":"bafyreibna5ivhju5fzk32x3hbkzbihut5vrazyn2kisi6q7yegtyxamqvi","uri":"at://did:plc:ab5inzxnpw4j2zvzlxupr5ut/app.bsky.feed.post/3lhnuqw5cms2h"}}},"langs":["en"],"text":""},"embed":{"$type":"app.bsky.embed.recordWithMedia#view","media":{"$type":"app.bsky.embed.images#view","images":[{"thumb":"https://cdn.bsky.app/img/feed_thumbnail/plain/did:plc:64fyz6rpsagabcfqzdxykwgg/bafkreibkxgznhp42mnr6dgxkfylsu53nkjlzte4mhmgvspx4ib55jfes3e@jpeg","fullsize":"https://cdn.bsky.app/img/feed_fullsize/plain/did:plc:64fyz6rpsagabcfqzdxykwgg/bafkreibkxgznhp42mnr6dgxkfylsu53nkjlzte4mhmgvspx4ib55jfes3e@jpeg","alt":"Bluesky Alt Text Rating\\nHow consistently do you use alt text?\\nMy score is 93%","aspectRatio":{"height":1238,"width":890}}]},"record":{"record":{"$type":"app.bsky.embed.record#viewRecord","uri":"at://did:plc:ab5inzxnpw4j2zvzlxupr5ut/app.bsky.feed.post/3lhnuqw5cms2h","cid":"bafyreibna5ivhju5fzk32x3hbkzbihut5vrazyn2kisi6q7yegtyxamqvi","author":{"did":"did:plc:ab5inzxnpw4j2zvzlxupr5ut","handle":"bpavuk.bsky.social","displayName":"Bohdan Pavuk","avatar":"https://cdn.bsky.app/img/avatar/plain/did:plc:ab5inzxnpw4j2zvzlxupr5ut/bafkreibx7jllyoabckrm3f7z5d2tctsbdd4xgnjuzm5ux73gk3zisnq3te@jpeg","associated":{"chat":{"allowIncoming":"all"}},"viewer":{"muted":false,"blockedBy":false},"labels":[],"createdAt":"2024-04-15T20:02:08.288Z"},"value":{"$type":"app.bsky.feed.post","createdAt":"2025-02-08T10:10:03.441Z","embed":{"$type":"app.bsky.embed.recordWithMedia","media":{"$type":"app.bsky.embed.images","images":[{"alt":"Bluesky Alt Text Rating - how many posts from the last 90 days contain alt text?\\nMu score is 92%","aspectRatio":{"height":2000,"width":972},"image":{"$type":"blob","ref":{"$link":"bafkreicjcy7iknl2tqviybl62yzvcfz7apwz7ft4neuilvsmd5pya747du"},"mimeType":"image/jpeg","size":256938}},{"alt":"Bluesky Alt Text Rating - how many posts you have ever posted contain alt text?\\nMy score is 74.49%","aspectRatio":{"height":2000,"width":972},"image":{"$type":"blob","ref":{"$link":"bafkreihfr6l6jqoel6dfywj5f6vtcefwijl2wqu77zup2tps76h3tip7re"},"mimeType":"image/jpeg","size":254119}}]},"record":{"$type":"app.bsky.embed.record","record":{"cid":"bafyreibza6aihtbew2oascknmknzajat7elrrgzztobm4gzvfjrr77erom","uri":"at://did:plc:g2nrqauct55qb6tcpepoo3dr/app.bsky.feed.post/3lhnqkp3a5c2h"}}},"facets":[{"features":[{"$type":"app.bsky.richtext.facet#link","uri":"https://dame.is/ratingalttext"}],"index":{"byteEnd":82,"byteStart":61}}],"langs":["en"],"text":"awesome rating, Dana!\\nand you, my reader, can check yours at dame.is/ratingalttext"},"labels":[],"likeCount":1,"replyCount":0,"repostCount":0,"quoteCount":1,"indexedAt":"2025-02-08T10:10:08.755Z","embeds":[{"$type":"app.bsky.embed.recordWithMedia#view","media":{"$type":"app.bsky.embed.images#view","images":[{"thumb":"https://cdn.bsky.app/img/feed_thumbnail/plain/did:plc:ab5inzxnpw4j2zvzlxupr5ut/bafkreicjcy7iknl2tqviybl62yzvcfz7apwz7ft4neuilvsmd5pya747du@jpeg","fullsize":"https://cdn.bsky.app/img/feed_fullsize/plain/did:plc:ab5inzxnpw4j2zvzlxupr5ut/bafkreicjcy7iknl2tqviybl62yzvcfz7apwz7ft4neuilvsmd5pya747du@jpeg","alt":"Bluesky Alt Text Rating - how many posts from the last 90 days contain alt text?\\nMu score is 92%","aspectRatio":{"height":2000,"width":972}},{"thumb":"https://cdn.bsky.app/img/feed_thumbnail/plain/did:plc:ab5inzxnpw4j2zvzlxupr5ut/bafkreihfr6l6jqoel6dfywj5f6vtcefwijl2wqu77zup2tps76h3tip7re@jpeg","fullsize":"https://cdn.bsky.app/img/feed_fullsize/plain/did:plc:ab5inzxnpw4j2zvzlxupr5ut/bafkreihfr6l6jqoel6dfywj5f6vtcefwijl2wqu77zup2tps76h3tip7re@jpeg","alt":"Bluesky Alt Text Rating - how many posts you have ever posted contain alt text?\\nMy score is 74.49%","aspectRatio":{"height":2000,"width":972}}]},"record":{"record":{"$type":"app.bsky.embed.record#viewRecord","uri":"at://did:plc:g2nrqauct55qb6tcpepoo3dr/app.bsky.feed.post/3lhnqkp3a5c2h","cid":"bafyreibza6aihtbew2oascknmknzajat7elrrgzztobm4gzvfjrr77erom","author":{"did":"did:plc:g2nrqauct55qb6tcpepoo3dr","handle":"danaenight.bsky.social","displayName":"Dana Nightingale","avatar":"https://cdn.bsky.app/img/avatar/plain/did:plc:g2nrqauct55qb6tcpepoo3dr/bafkreietdjqd4xkz6ap4qs7s3wniwaw3j33zvh2d6hpora7pwleieqosvq@jpeg","associated":{"chat":{"allowIncoming":"all"}},"viewer":{"muted":false,"blockedBy":false},"labels":[],"createdAt":"2023-06-26T19:02:39.021Z"},"value":{"$type":"app.bsky.feed.post","createdAt":"2025-02-08T08:54:59.793Z","embed":{"$type":"app.bsky.embed.recordWithMedia","media":{"$type":"app.bsky.embed.images","images":[{"alt":"My alt-text score is 97.06%. There's a radial meter with the needle deep in the green.","aspectRatio":{"height":229,"width":326},"image":{"$type":"blob","ref":{"$link":"bafkreigpvz3d2jh46oeadhlraczhz46kajrtsrztcekf44f7ih3amgziby"},"mimeType":"image/jpeg","size":31630}}]},"record":{"$type":"app.bsky.embed.record","record":{"cid":"bafyreiebyz62prxim6cgt6u2jy2odrpoo6phuhuk23fzq7uomrj6wf3n3m","uri":"at://did:plc:gq4fo3u6tqzzdkjlwzpb23tj/app.bsky.feed.post/3lft5dg5qgc2p"}}},"langs":["en"],"text":"Celebrating small victories. ✨"},"labels":[],"likeCount":8,"replyCount":1,"repostCount":0,"quoteCount":1,"indexedAt":"2025-02-08T08:55:00.951Z"}}}]}}},"replyCount":0,"repostCount":0,"likeCount":4,"quoteCount":0,"indexedAt":"2025-02-08T10:15:16.048Z","viewer":{"threadMuted":false,"embeddingDisabled":false},"labels":[]}
"""

		let post = try JSONDecoder.atJSONDecoder.decode(Bsky.Feed.PostView.self, from: Data(json.utf8))
		
		#expect(post.author.handle == "iamkonstantin.eu")

		guard case let .post(postRecord) = post.record else { fatalError() }
		
		guard case let .embedRecordWithMedia(embedRecordWithMedia) = postRecord.embed else { fatalError() }
		
		guard case let .images(images) = embedRecordWithMedia.media else { fatalError() }

		#expect(images.images.count == 1)
		let image = try #require(images.images.first)
		
		#expect(image.alt == "Bluesky Alt Text Rating\nHow consistently do you use alt text?\nMy score is 93%")
		
		guard case .embedRecordWithMediaView(_) = post.embed else { fatalError() }
	}
	
	@Test func postWithVideo() throws {
		let json = """
{"uri":"at://did:plc:l7mosai5i2u562b5qbosw6c7/app.bsky.feed.post/3lhnr2o6kb22h","cid":"bafyreiepnzmbdht5jwqobzo7pod44eyl6hbyjlbjaqjhbsl5cboclm2hgi","author":{"did":"did:plc:l7mosai5i2u562b5qbosw6c7","handle":"kamhoyung.bsky.social","displayName":"Kamhoyung","avatar":"https://cdn.bsky.app/img/avatar/plain/did:plc:l7mosai5i2u562b5qbosw6c7/bafkreif5tzhtlnxmtyefl3wdw63mcba3jmcqhcfioe3p7ygwko6pvg2gji@jpeg","viewer":{"muted":false,"blockedBy":false,"following":"at://did:plc:klsh7edzj3jmxucibyjqstb3/app.bsky.graph.follow/3lbpuikh4gc2v","followedBy":"at://did:plc:l7mosai5i2u562b5qbosw6c7/app.bsky.graph.follow/3lbputyk77n2i"},"labels":[],"createdAt":"2024-11-16T21:07:24.870Z"},"record":{"$type":"app.bsky.feed.post","createdAt":"2025-02-08T09:03:55.725Z","embed":{"$type":"app.bsky.embed.video","aspectRatio":{"height":1920,"width":1920},"video":{"$type":"blob","ref":{"$link":"bafkreic3uqlah5pnqzq4tx2r5cg6kyj2uziq4jn4uatuwdhvl33sx2qkgm"},"mimeType":"video/mp4","size":1387501}},"facets":[{"features":[{"$type":"app.bsky.richtext.facet#tag","tag":"swiftUI"}],"index":{"byteEnd":142,"byteStart":134}},{"features":[{"$type":"app.bsky.richtext.facet#tag","tag":"iOS"}],"index":{"byteEnd":147,"byteStart":143}},{"features":[{"$type":"app.bsky.richtext.facet#tag","tag":"beginner"}],"index":{"byteEnd":157,"byteStart":148}},{"features":[{"$type":"app.bsky.richtext.facet#tag","tag":"code"}],"index":{"byteEnd":163,"byteStart":158}},{"features":[{"$type":"app.bsky.richtext.facet#tag","tag":"keeplearning"}],"index":{"byteEnd":177,"byteStart":164}}],"langs":["en"],"text":"Once the widget was setup, it was surprisingly easy to add a lock screen widget... Introducing: the 'The ‘Oh right!’ Button\\" 😄\\n#swiftUI #iOS #beginner #code #keeplearning"},"embed":{"$type":"app.bsky.embed.video#view","cid":"bafkreic3uqlah5pnqzq4tx2r5cg6kyj2uziq4jn4uatuwdhvl33sx2qkgm","playlist":"https://video.bsky.app/watch/did%3Aplc%3Al7mosai5i2u562b5qbosw6c7/bafkreic3uqlah5pnqzq4tx2r5cg6kyj2uziq4jn4uatuwdhvl33sx2qkgm/playlist.m3u8","thumbnail":"https://video.bsky.app/watch/did%3Aplc%3Al7mosai5i2u562b5qbosw6c7/bafkreic3uqlah5pnqzq4tx2r5cg6kyj2uziq4jn4uatuwdhvl33sx2qkgm/thumbnail.jpg","aspectRatio":{"height":1920,"width":1920}},"replyCount":0,"repostCount":0,"likeCount":0,"quoteCount":0,"indexedAt":"2025-02-08T09:03:56.554Z","viewer":{"threadMuted":false,"embeddingDisabled":false},"labels":[]}
"""

		let post = try JSONDecoder.atJSONDecoder.decode(Bsky.Feed.PostView.self, from: Data(json.utf8))
		
		#expect(post.author.handle == "kamhoyung.bsky.social")

		guard case let .post(postRecord) = post.record else { fatalError() }
		
		guard case let .embedVideo(embedVideo) = postRecord.embed else { fatalError() }
		
		#expect(embedVideo.video.mimeType == "video/mp4")
		
		guard case let .embedVideoView(embedVideoView) = post.embed else { fatalError() }
		let videoAspectRatio = try #require(embedVideoView.aspectRatio)
		
		#expect(embedVideoView.playlist == "https://video.bsky.app/watch/did%3Aplc%3Al7mosai5i2u562b5qbosw6c7/bafkreic3uqlah5pnqzq4tx2r5cg6kyj2uziq4jn4uatuwdhvl33sx2qkgm/playlist.m3u8")
		#expect(embedVideoView.thumbnail == "https://video.bsky.app/watch/did%3Aplc%3Al7mosai5i2u562b5qbosw6c7/bafkreic3uqlah5pnqzq4tx2r5cg6kyj2uziq4jn4uatuwdhvl33sx2qkgm/thumbnail.jpg")
		#expect(videoAspectRatio.height == 1920)
		#expect(videoAspectRatio.width == 1920)
	}
	
	@Test func embedViewImageWithoutAspectRatio() throws {
		let json = """
{"thumb":"https://bsky.com/thumbnail.jpg","fullsize":"https://bsky.com/img/feed_fullsize/plain/did:plc:z7ja/bafk@jpeg","alt":""}
"""

		let embed = try JSONDecoder.atJSONDecoder
			.decode(
				Bsky.Embed.Images.ViewImage.self,
				from: Data(json.utf8)
			)
		
		#expect(embed.thumb == "https://bsky.com/thumbnail.jpg")
		#expect(embed.fullsize == "https://bsky.com/img/feed_fullsize/plain/did:plc:z7ja/bafk@jpeg")
		#expect(embed.alt == "")
		#expect(embed.aspectRatio == nil)
	}
	
	@Test func embedViewVideoWithoutAspectRatio() throws {
		let json = """
{"$type":"app.bsky.embed.video#view","cid":"123abcde890","playlist":"https://example-url.bsky.com/playlist.m3u8","thumbnail":"https://example-url.bsky.com/thumbnail.jpg"}
"""

		let embed = try JSONDecoder.atJSONDecoder
			.decode(
				Bsky.Embed.Video.View.self,
				from: Data(json.utf8)
			)
		
		#expect(embed.cid == "123abcde890")
		#expect(embed.playlist == "https://example-url.bsky.com/playlist.m3u8")
		#expect(embed.thumbnail == "https://example-url.bsky.com/thumbnail.jpg")
		#expect(embed.aspectRatio == nil)
	}
}
