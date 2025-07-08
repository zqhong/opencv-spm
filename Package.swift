// swift-tools-version: 5.10
import PackageDescription

let version = "4.12.0"
let checksum = "0087d3a1ee38b793db5fa780039777869cbe764e018bb6d148bf95ea2a3655e2"

let package = Package(
    name: "OpenCV",
    platforms: [
        .macOS(.v14_0)
    ],
    products: [
        .library(
            name: "OpenCV",
            targets: ["opencv2", "opencv2-dependencies"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "opencv2",
            url: "https://github.com/zqhong/opencv-spm/releases/download/\(version)/opencv2.xcframework.zip",
            checksum: checksum
        ),
        .target(
            name: "opencv2-dependencies",
            linkerSettings: [
                .linkedFramework("AVFoundation"),
                .linkedFramework("CoreImage"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("Accelerate"),
                .linkedLibrary("c++")
            ]
        )
    ]
)
