//
//  Steamer.swift
//  Steamer
//
//  Created by Mikhail Churbanov on 20/06/2018.
//

import Command

class Steamer: Container {

    static func run() {
        let steamer = Steamer()
        do {
            var runInput = steamer.environment.commandInput
            let console = try steamer.make(Console.self)
            let command = try steamer.make(Commands.self).group()
            try console.run(command, input: &runInput, on: steamer).wait()
        } catch {
            let errorDescription: String
            if let error = error as? SteamerError {
                errorDescription = error.description
            } else {
                errorDescription = error.localizedDescription
            }
            Terminal().error(errorDescription)
        }
    }

    let config: Config
    let environment: Environment
    let services: Services
    let serviceCache: ServiceCache
    let eventLoop: EventLoop

    private init() {
        config = Config()
        environment = .development
        services = .default()
        serviceCache = ServiceCache()
        eventLoop = EmbeddedEventLoop()
    }

}

//import Foundation
//import Yams
//import SwaggerParser
//import Service
//
//struct SteamerConfig: Encodable {
//    let fileHeaderName: String
//
//    static let `default` = SteamerConfig(fileHeaderName: "FileHeader")
//}
//
//struct SessionContext: Encodable {
//    let config: SteamerConfig
//    let timestamp: Date
//}
//
//class Steamer {
//
//    let config: SteamerConfig = .default
//    let container: Container = BasicContainer(config: Config(),
//                                              environment: .development,
//                                              services: Services(),
//                                              on: EmbeddedEventLoop())
//
//    var processors: [Processor] = []
//
//    init() {
//        processors = [
//            ModelProcessor(context: self)
//        ]
//    }
//
//    func run() {
//
//    }
//
//    func process(file: String) {
//        guard let string = try? String(contentsOfFile: file, encoding: .utf8) else {
//            return
//        }
//        let decoder: StringDecoder = file.hasSuffix("yaml") ? YAMLDecoder() : JSONDecoder()
//        guard let swagger = try? Swagger(from: string, decoder: decoder) else {
//            return
//        }
//        let session = SessionContext(config: config, timestamp: Date())
//        switch swagger {
//        case .v2:
//            return
//        case let .v3(openApi3):
//            processors.forEach { $0.process(document: openApi3, session: session) }
//        }
//    }
//}
