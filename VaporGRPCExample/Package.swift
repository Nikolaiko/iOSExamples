// swift-tools-version:5.8
import PackageDescription

let package = Package(
    name: "gRPCServer",
    platforms: [
       .macOS(.v13)
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "4.77.1"),
        .package(url: "https://github.com/grpc/grpc-swift.git", from: "1.19.0"),
    ],
    targets: [
        .executableTarget(
            name: "App",
            dependencies: [
                .product(name: "GRPC", package: "grpc-swift"),
                .product(name: "Vapor", package: "vapor")
            ]
        ),
        .testTarget(name: "AppTests", dependencies: [
            .target(name: "App"),
            .product(name: "XCTVapor", package: "vapor"),
        ])
    ]
)
