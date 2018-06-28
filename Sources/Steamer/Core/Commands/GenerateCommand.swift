//
//  GenerateCommand.swift
//  Steamer
//
//  Created by Mikhail Churbanov on 27/06/2018.
//

import Command

struct GenerateCommand: Command, ServiceType {

    // MARK: - Command

    var arguments: [CommandArgument] {
        return [.argument(name: "document", help: ["- filename or url of OpenAPI document"])]
    }

    var options: [CommandOption] {
        return []
    }

    var help: [String] {
        return []
    }

    func run(using context: CommandContext) throws -> Future<Void> {
        let document = try context.argument("document")
        let contentProviders = try context.container.make(ContentProviders.self)
        guard let contentProvider = contentProviders.pick(for: document) else {
            let error = SteamerError(description: "No content provider available to read:\n\(document)")
            return context.container.future(error: error)
        }
        return try contentProvider.read(document: document).do { documentContents in
            context.console.success("Loaded \(documentContents.lengthOfBytes(using: .utf8)) bytes from: \(document)")
        }.map { documentContents in
            return
        }
    }

    // MARK: - ServiceType

    static func makeService(for worker: Container) throws -> GenerateCommand {
        return .init()
    }

}

