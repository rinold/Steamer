//
//  HttpContentProvider.swift
//  Steamer
//
//  Created by Mikhail Churbanov on 28/06/2018.
//

import Console
import Service
import HTTP

class HttpContentProvider: ContentProvider {

    let group: EventLoopGroup
    let container: Container

    init(on worker: Container) {
        container = worker
        group = MultiThreadedEventLoopGroup(numberOfThreads: 2)
    }

    func canGetContents(of document: String) -> Bool {
        if let url = URL(string: document) {
            return !url.isFileURL
        }
        return false
    }

    func contents(of document: String) throws -> Future<Data> {
        guard let url = URL(string: document) else {
            throw SteamerError(description: "Can't create URL from: \(document)")
        }
        guard let host = url.host, let scheme = url.scheme?.convertToHTTPScheme else {
            throw SteamerError(description: "No URL host or scheme available in: \(document)")
        }
        try container.make(Console.self).info("Fetching: \(document)")
        let client = try HTTPClient.connect(scheme: scheme, hostname: host, on: group).wait()
        let request = HTTPRequest(method: .GET, url: url)
        return client.send(request).map { response in
            guard response.isSuccessfull else {
                throw SteamerError(description: "Unsuccessfull HTTP response: \(response.description)")
            }
            return response.body.data ?? Data()
        }
    }

}

// MARK: - ServiceType conformance

extension HttpContentProvider: ServiceType {
    static func makeService(for worker: Container) throws -> Self {
        return .init(on: worker)
    }
}
