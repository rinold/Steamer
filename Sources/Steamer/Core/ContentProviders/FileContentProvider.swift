//
//  FileContentProvider.swift
//  Steamer
//
//  Created by Mikhail Churbanov on 28/06/2018.
//

import Foundation
import Service

class FileContentProvider: ContentProvider {

    let container: Container

    init(on worker: Container) {
        container = worker
    }

    func canRead(document: String) -> Bool {
        let fileUrl = URL(fileURLWithPath: document)
        return FileManager.default.fileExists(atPath: fileUrl.path)
    }
    
    func read(document: String) throws -> Future<String> {
        let contents = try String(contentsOfFile: document, encoding: .utf8)
        return container.eventLoop.newSucceededFuture(result: contents)
    }
    
}

// MARK: - ServiceType conformance

extension FileContentProvider: ServiceType {
    static func makeService(for worker: Container) throws -> Self {
        return .init(on: worker)
    }
}
