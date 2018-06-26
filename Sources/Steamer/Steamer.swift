//
//  Steamer.swift
//  Steamer
//
//  Created by Mikhail Churbanov on 20/06/2018.
//

import Foundation
import Yams
import SwaggerParser
import Service

class Steamer {

    let container = BasicContainer(config: Config(),
                                   environment: .development,
                                   services: Services(),
                                   on: EmbeddedEventLoop())

    var processors: [Processor]

    init() {
        processors = [
            ModelProcessor(container: container)
        ]
    }

    func process(file: String) {
        guard let string = try? String(contentsOfFile: file, encoding: .utf8) else {
            return
        }
        let decoder: StringDecoder = file.hasSuffix("yaml") ? YAMLDecoder() : JSONDecoder()
        guard let swagger = try? Swagger(from: string, decoder: decoder) else {
            return
        }
        self.processOAS(swagger)
    }

    func processOAS(_ swagger: Swagger) {
        switch swagger {
        case .v2:
            return
        case let .v3(openApi3):
            processors.forEach { $0.process(document: openApi3) }
        }
    }
}
