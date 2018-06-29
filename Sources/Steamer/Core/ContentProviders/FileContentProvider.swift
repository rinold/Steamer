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

    func canGetContents(of document: String) -> Bool {
        let httpScheme = URL(string: document)?.scheme?.convertToHTTPScheme
        return (httpScheme == nil)
    }
    
    func contents(of document: String) throws -> Future<Data> {
        guard FileManager.default.fileExists(atPath: document) else {
            let error = SteamerError(description: ":(")
            let failedFuture: Future<Data> = container.future(error: error)
            return failedFuture
        }
        let url = URL(fileURLWithPath: document)
        let contents = try Data(contentsOf: url)
        return container.future(contents)
    }
    
}

// MARK: - ServiceType conformance

extension FileContentProvider: ServiceType {
    static func makeService(for worker: Container) throws -> Self {
        return .init(on: worker)
    }
}
