// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AlchemyGenerator",
    products: [
        .library(
            name: "AlchemyGenerator",
            targets: ["AlchemyGenerator"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/SirWellington/alchemytest",
            from:(.branch("develop"))
        )
    ],
    targets: [
        .target(
            name: "AlchemyGenerator",
            dependencies: []
        ),
        .testTarget(
            name: "AlchemyGeneratorTests",
            dependencies: ["AlchemyGenerator"]
        ),
    ]
)
