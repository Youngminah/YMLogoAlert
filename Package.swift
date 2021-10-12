// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "YMLogoAlert",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "YMLogoAlert",
                 targets: ["YMLogoAlert"])
    ],
    targets: [
        .target(name: "YMLogoAlert",
                path: "YMLogoAlert/Classes")
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
