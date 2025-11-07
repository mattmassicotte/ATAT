public struct ATProto {
	public struct Server {
		public struct DescribeServer: Codable, Hashable, Sendable {
			public struct Contact: Codable, Hashable, Sendable {
				public let email: String?

				public init(email: String?) {
					self.email = email
				}
			}

			public struct Links: Codable, Hashable, Sendable {
				public let privacyPolicy: ATProtoURI?
				public let termsOfService: ATProtoURI?

				public init(privacyPolicy: ATProtoURI, termsOfService: ATProtoURI) {
					self.privacyPolicy = privacyPolicy
					self.termsOfService = termsOfService
				}
			}

			public let did: ATProtoDID
			public let availableUserDomains: [String]
			public let inviteCodeRequired: Bool?
			public let phoneVerificationRequired: Bool?
			public let contact: Contact?
			public let links: Links?

			public init(
				did: ATProtoDID,
				availableUserDomains: [String],
				inviteCodeRequired: Bool?,
				phoneVerificationRequired: Bool?,
				contact: Contact?,
				links: Links?
			) {
				self.did = did
				self.availableUserDomains = availableUserDomains
				self.inviteCodeRequired = inviteCodeRequired
				self.phoneVerificationRequired = phoneVerificationRequired
				self.contact = contact
				self.links = links
			}
		}
	}

	public struct Repo {
		public struct DescribeRepo<DIDDocument: Codable & Hashable & Sendable>: Codable, Hashable, Sendable {
			public let handle: String
			public let did: ATProtoDID
			public let didDoc: DIDDocument
			public let collections: [String]
			public let handleIsCorrect: Bool

			public init(handle: String, did: ATProtoDID, didDoc: DIDDocument, collections: [String], handleIsCorrect: Bool) {
				self.handle = handle
				self.did = did
				self.didDoc = didDoc
				self.collections = collections
				self.handleIsCorrect = handleIsCorrect
			}
		}
	}
}
