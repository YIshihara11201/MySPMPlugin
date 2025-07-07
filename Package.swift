// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MySPMPlugin",
    products: [
       .plugin(name: "MySPMPlugin", targets: ["MyPlugin"]),
    ],
    targets: [
        .plugin(
          name: "MyPlugin",
          capability: .buildTool(),
          dependencies: ["MyHelper"]
        ),
        .executableTarget(name: "MyHelper"),
    ]
)
