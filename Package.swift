// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to
// build this package.

import PackageDescription

let package = Package(
  name: "Tokamak",
  platforms: [
    .macOS(.v10_15),
  ],
  products: [
    // Products define the executables and libraries produced by a package,
    // and make them visible to other packages.
    .library(
      name: "Tokamak",
      targets: ["Tokamak"]
    ),
    .library(
      name: "TokamakTestRenderer",
      targets: ["TokamakTestRenderer"]
    ),
  ],
  dependencies: [
    // Dependencies declare other packages that this package depends on.
    // .package(url: /* package url */, from: "1.0.0"),
    .package(url: "https://github.com/wickwirew/Runtime.git", .branch("master")),
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define
    // a module or a test suite.
    // Targets can depend on other targets in this package, and on products
    // in packages which this package depends on.
    .target(
      name: "Tokamak",
      dependencies: ["Runtime"]
    ),
    .target(
      name: "TokamakDemo",
      dependencies: ["Tokamak"]
    ),
    .target(
      name: "TokamakDOM",
      dependencies: ["Tokamak"]
    ),
    .target(
      name: "TokamakTestRenderer",
      dependencies: ["Tokamak"]
    ),
    .testTarget(
      name: "TokamakTests",
      dependencies: ["TokamakDemo", "TokamakTestRenderer"]
    ),
  ]
)
