//
//  ContentProviders.swift
//  Steamer
//
//  Created by Mikhail Churbanov on 28/06/2018.
//

import Service

final class ContentProviders: Service {
    private let container: Container
    private var providers: [ContentProvider]

    init(container: Container) {
        self.container = container
        self.providers = []
    }

    func register<Provider>(_ type: Provider.Type) throws where Provider: ContentProvider {
        let provider = try container.make(Provider.self)
        providers.append(provider)
    }

    func pick(for document: String) -> ContentProvider? {
        return providers.first(where: { $0.canRead(document: document) })
    }
}
