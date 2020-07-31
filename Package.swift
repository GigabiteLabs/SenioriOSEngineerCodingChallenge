// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SenioriOSEngineerCodingChallenge",
    platforms: [
        .macOS(.v10_15), .iOS(.v13),
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "senior-dev-submission",
            targets: ["senior-dev-submission"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "senior-dev-submission",
        // uncomment this section and provide
        // mappings to any assets required for
        // your cocoapod in the /Assets folder
        //
        // See this documentaion for more info: https://medium.com/swlh/swift-5-3-sailing-towards-performance-and-quality-b254b74778ab
        // keyword search "resources" to read up on
        // SPM support for resource files.
        //
        // See also: https://github.com/apple/swift-evolution/blob/master/proposals/0271-package-manager-resources.md
        //
        //    resources: [
        //        .process("Sources/Assets/words.txt"),
        //    ],
            path: "senior-dev-submission",
            sources: ["Classes"]
        ),
        .testTarget(
            name: "senior-dev-submission_Tests",
            dependencies: ["senior-dev-submission"],
            path: "Example/Tests",
            sources: ["Sources"]
        )
    ]
)
