// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Steamer",
    dependencies: [
        .package(url: "https://github.com/rinold/SwaggerParser.git", from: "0.7.0-alpha.0"),
    ],
    targets: [
        .target(
            name: "Steamer",
            dependencies: ["SwaggerParser"]),
    ]
)
