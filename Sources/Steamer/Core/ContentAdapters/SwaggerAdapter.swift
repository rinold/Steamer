//
//  SwaggerAdapter.swift
//  Steamer
//
//  Created by Mikhail Churbanov on 29/06/2018.
//

import Service

class SwaggerAdapter: ContentAdapter{

    let container: Container

    init(on worker: Container) {
        container = worker
    }

    func adapt(content: Any) throws -> Any {
        guard let data = content as? Data else {
            throw SteamerError()
        }
        return try adapt(content: data)
    }

    private func adapt(content: Data) throws -> String {
        guard let adaptedContent = String(data: content, encoding: .utf8) else {
            throw SteamerError()
        }
        return adaptedContent
    }

}

// MARK: - ServiceType conformance

extension SwaggerAdapter: ServiceType {
    static func makeService(for worker: Container) throws -> Self {
        return .init(on: worker)
    }
}
