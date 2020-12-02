// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "day_1",
    dependencies: [
		.package(url: "https://github.com/apple/swift-argument-parser", from: "0.3.0"),
		.package(url: "https://github.com/Furthermoore/AOCKit", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "day_1",
            dependencies: ["AOCKit", .product(name: "ArgumentParser", package: "swift-argument-parser")]),
        .testTarget(
            name: "day_1Tests",
            dependencies: ["day_1"]),
    ]
)
