// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CartoonCharactersScreen",
    platforms: [.iOS(.v17)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "CartoonCharactersScreen",
            targets: ["CartoonCharactersScreen"]),
    ],
    dependencies: [
        .package(path: "../NetworkLibrary"),
        .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "1.3.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "CartoonCharactersScreen",
            dependencies: [
                .product(name: "NetworkLibrary", package: "NetworkLibrary"),
                .product(name: "Dependencies", package: "swift-dependencies"),
            ]
        ),
        .testTarget(
            name: "CartoonCharactersScreenTests",
            dependencies: ["CartoonCharactersScreen"]),
    ]
)
