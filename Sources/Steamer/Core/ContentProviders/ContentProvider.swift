//
//  ContentProvider.swift
//  Steamer
//
//  Created by Mikhail Churbanov on 28/06/2018.
//

import Async

protocol ContentProvider {
    func canRead(document: String) -> Bool
    func read(document: String) throws -> Future<String>
}

