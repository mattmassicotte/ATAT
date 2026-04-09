// swift-tools-version: 6.1

import PackageDescription

let package = Package(
	name: "ATAT",
	platforms: [
		.macOS(.v10_15),
		.macCatalyst(.v13),
		.iOS(.v13),
		.tvOS(.v13),
		.watchOS(.v6),
		.visionOS(.v1),
	],
	products: [
		.library(name: "ATAT", targets: ["ATAT"]),
	],
	traits: [
		.trait(
			name: "CIDCoding",
			description: "Enables full CID encoding and decoding"
		),
		.trait(
			name: "SwiftCrypto",
			description: "Use swift-crypto"
		),
		.default(enabledTraits: []),
	],
	dependencies: [
		.package(
			url: "https://github.com/swift-libp2p/swift-bases",
			from: "0.2.0"
		),
		.package(
			url: "https://github.com/apple/swift-crypto.git",
			"1.0.0" ..< "4.0.0"
		),
	],
	targets: [
		.target(
			name: "ATAT",
			dependencies: [
				.product(name: "Base32", package: "swift-bases", condition: .when(traits: ["CIDCoding"])),
				.product(name: "Crypto", package: "swift-crypto", condition: .when(traits: ["SwiftCrypto"])),
			]
		),
		.testTarget(
			name: "ATATTests",
			dependencies: [
				"ATAT",
				.product(name: "BaseX", package: "swift-bases", condition: .when(traits: ["CIDCoding"])),
			]
		),
		.target(name: "Lexicon"),
		.testTarget(
			name: "LexiconTests",
			dependencies: ["Lexicon"]
		)
	]
)
