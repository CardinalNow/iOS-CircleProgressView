// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "CircleProgressView",
    platforms: [.iOS(.v8)],
    products: [
        .library(
            name: "CircleProgressView",
            targets: ["CircleProgressView"]),
    ],
    targets: [
        .target(
            name: "CircleProgressView",
            path: "CircleProgressView"),
    ],
    swiftLanguageVersions: [.v4_2]
)
