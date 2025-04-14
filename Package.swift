// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "AlchemyGenerator",
    platforms: [
        .macOS(.v12),
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "AlchemyGenerator",
            targets: ["AlchemyGenerator"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/SirWellington/alchemytest",
            branch: "develop"
        )
    ],
    targets: [
        .target(
            name: "AlchemyGenerator",
            dependencies: []
        ),
        .testTarget(
            name: "AlchemyGeneratorTests",
            dependencies: [
                "AlchemyGenerator",
                .product(
                    name: "AlchemyTest",
                    package: "alchemytest"
                )
            ]
        )
    ]
)
