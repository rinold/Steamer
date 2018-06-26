// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Steamer",
    dependencies: [
        .package(url: "https://github.com/rinold/SwaggerParser.git", from: "0.8.0"),
        .package(url: "https://github.com/jpsim/Yams.git", from: "1.0.0"),
        .package(url: "https://github.com/vapor/leaf.git", from: "3.0.0-rc.2"),
    ],
    targets: [
        .target(
            name: "Steamer",
            dependencies: ["SwaggerParser", "Yams", "Leaf"]),
    ]
)
