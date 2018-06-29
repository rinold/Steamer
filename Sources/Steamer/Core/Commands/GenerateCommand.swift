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
        let contentAdapter = try context.container.make(ContentAdapter.self)
        return try contentProvider
            .contents(of: document)
            .flatMap { data in
                return try context.container.future(contentAdapter.adapt(content: data))
            }.map { result in
                print (result)
        }
    }

    // MARK: - ServiceType

    static func makeService(for worker: Container) throws -> GenerateCommand {
        return .init()
    }

}

