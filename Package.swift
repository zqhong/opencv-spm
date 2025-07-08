// swift-tools-version: 5.10
import PackageDescription

let version = "4.12.0"
let checksum = "21f8235b244566ae6edbf1ab36d8dfd45cd21a0452372f4b227cf8a7dc21f324"

let package = Package(
    name: "OpenCV",
    platforms: [
        .macOS(.v13)
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
