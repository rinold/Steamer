//
//  Processors.swift
//  Steamer
//
//  Created by Mikhail Churbanov on 21/06/2018.
//

import OpenAPI3

protocol Processor {
    func process(document: OpenAPI3)
}
