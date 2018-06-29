//
//  ContentProvider.swift
//  Steamer
//
//  Created by Mikhail Churbanov on 28/06/2018.
//

import Foundation
import Async

protocol ContentProvider {
    func canGetContents(of document: String) -> Bool
    func contents(of document: String) throws -> Future<Data>
}
