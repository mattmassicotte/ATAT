// swift-tools-version: 6.0

import PackageDescription

let package = Package(
	name: "ATAT",
	products: [
		.library(name: "ATAT", targets: ["ATAT"]),
	],
	targets: [
		.target(name: "ATAT"),
		.testTarget(
			name: "ATATTests",
			dependencies: ["ATAT"]
		),
	]
)
