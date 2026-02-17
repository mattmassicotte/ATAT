import Foundation
import Testing
import ATAT

struct ActorTests {
	@Test
	func getProfiles() throws {
		let json = """
 {"profiles":[{"did":"did:plc:3nlkmby2zllrhcj6z5dnicui","handle":"andresitorresm.com","displayName":"andrés ignacio torres","avatar":"https://cdn.bsky.app/img/avatar/plain/did:plc:3nlkmby2zllrhcj6z5dnicui/bafkreiczuaxfwkgem6ivkagbxyz3x4qfg2vlxnui652e34artvops4tlzq@jpeg","associated":{"lists":0,"feedgens":1,"starterPacks":0,"labeler":false,"activitySubscription":{"allowSubscriptions":"followers"}},"viewer":{"muted":false,"blockedBy":false,"following":"at://did:plc:klsh7edzj3jmxucibyjqstb3/app.bsky.graph.follow/3lg3vlosyf22p","followedBy":"at://did:plc:3nlkmby2zllrhcj6z5dnicui/app.bsky.graph.follow/3lg34ujdevu2v","knownFollowers":{"count":3,"followers":[{"did":"did:plc:xqkgbibiqknxk5cu4wpeij2m","handle":"autistic.af","displayName":"Alex Karp (not the CEO)","avatar":"https://cdn.bsky.app/img/avatar/plain/did:plc:xqkgbibiqknxk5cu4wpeij2m/bafkreiaaybrvopn6fmktmyfg2rdyjcn7jcsbbnr2jrjg2i27rnklyrfveq@jpeg","associated":{"chat":{"allowIncoming":"all"},"activitySubscription":{"allowSubscriptions":"followers"}},"viewer":{"muted":false,"blockedBy":false,"following":"at://did:plc:klsh7edzj3jmxucibyjqstb3/app.bsky.graph.follow/3lapgsbg3zj2q","followedBy":"at://did:plc:xqkgbibiqknxk5cu4wpeij2m/app.bsky.graph.follow/3laphfc66t32f"},"labels":[],"createdAt":"2023-05-01T15:15:11.196Z"},{"did":"did:plc:yqu5sj6vz3mimqmdoe52r5qg","handle":"hunter-spatial.bsky.social","displayName":"Hunter Harris ᯅ Vision Pro","avatar":"https://cdn.bsky.app/img/avatar/plain/did:plc:yqu5sj6vz3mimqmdoe52r5qg/bafkreietcjlvlafesadp34s2mcxd7ycha6ky2atu6unjfzweszntbwd2ca@jpeg","associated":{"activitySubscription":{"allowSubscriptions":"followers"}},"viewer":{"muted":false,"blockedBy":false,"following":"at://did:plc:klsh7edzj3jmxucibyjqstb3/app.bsky.graph.follow/3lkq23kold42x","followedBy":"at://did:plc:yqu5sj6vz3mimqmdoe52r5qg/app.bsky.graph.follow/3lkpz7id5y32k"},"labels":[],"createdAt":"2024-11-22T07:11:02.553Z"},{"did":"did:plc:ncbbqss4dcsridclxkki3v52","handle":"eternalstorms.at","displayName":"Matthias Gansrigler-Hrad","avatar":"https://cdn.bsky.app/img/avatar/plain/did:plc:ncbbqss4dcsridclxkki3v52/bafkreiese42pdt4dtiq34gxoovrcdyijds74lehsjny66utiev5dryhvru@jpeg","associated":{"chat":{"allowIncoming":"following"},"activitySubscription":{"allowSubscriptions":"followers"}},"viewer":{"muted":false,"blockedBy":false,"following":"at://did:plc:klsh7edzj3jmxucibyjqstb3/app.bsky.graph.follow/3lapolm36h52y","followedBy":"at://did:plc:ncbbqss4dcsridclxkki3v52/app.bsky.graph.follow/3larffbfxw327"},"labels":[],"createdAt":"2023-10-22T11:29:48.143Z"}]}},"labels":[],"createdAt":"2023-05-30T17:52:27.302Z","description":"hello","indexedAt":"2026-01-24T00:05:47.146Z","banner":"https://cdn.bsky.app/img/banner/plain/did:plc:3nlkmby2zllrhcj6z5dnicui/bafkreigrcansqcebj6e462pfboph6bsqpeq7z3m3xuipmhdd7lxno6hqom@jpeg","followersCount":676,"followsCount":3712,"postsCount":422,"pinnedPost":{"cid":"bafyreigq7wq6rstdjc2pdndryjo5q2npyzh4oy4ea62zdg6xhcy3h5i4hy","uri":"at://did:plc:3nlkmby2zllrhcj6z5dnicui/app.bsky.feed.post/3liy75tlg7c2f"}}]}
 """

		let response = try ATJSONDecoder().decode(Bsky.Actor.GetProfilesResponse.self, from: Data(json.utf8))

		#expect(response.profiles[0].did == "did:plc:3nlkmby2zllrhcj6z5dnicui")
		#expect(response.profiles[0].handle == "andresitorresm.com")
	}
}
