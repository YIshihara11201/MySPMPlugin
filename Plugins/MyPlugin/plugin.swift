import Foundation
import PackagePlugin

@main
struct MyBuildToolPlugin: BuildToolPlugin {
  func createBuildCommands(
    context: PluginContext,
    target: Target
  ) async throws -> [Command] {
    print("BuildToolPlugin")
    let tool = try context.tool(named: "MyHelper")
    return [
      .buildCommand(
        displayName: "Running my-helper for \(target.name)",
        executable: tool.path,
        arguments: [],
        outputFiles: []
      )
    ]
  }
}

#if canImport(XcodeProjectPlugin)
import XcodeProjectPlugin

extension MyBuildToolPlugin: XcodeBuildToolPlugin {
  func createBuildCommands(
    context: XcodeProjectPlugin.XcodePluginContext,
    target: XcodeProjectPlugin.XcodeTarget
  ) throws -> [PackagePlugin.Command] {
    print("XcodeBuildToolPlugin")
    let tool = try context.tool(named: "MyHelper")
    return [
      .buildCommand(
        displayName: "Running my-helper for \(target.displayName)",
        executable: tool.path,
        arguments: ["--input", "test"],
        outputFiles: []
      )
    ]
  }
}
#endif
