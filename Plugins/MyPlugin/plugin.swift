import PackagePlugin

@main
struct MyBuildToolPlugin: BuildToolPlugin {
    func createBuildCommands(
        context: PluginContext,
        target: Target
    ) async throws -> [Command] {
        let tool = try context.tool(named: "my-helper")
        return [
            .buildCommand(
                displayName: "Running my-helper for \(target.name)",
                executable: tool.path,
                arguments: ["--input", "\(target.directory)"],
                outputFiles: [target.directory.appending("Generated/output.swift")]
            )
        ]
    }
}
