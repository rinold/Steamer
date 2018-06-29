//
//  ContentAdapter.swift
//  Steamer
//
//  Created by Mikhail Churbanov on 29/06/2018.
//

import Service

protocol ContentAdapter {
    func adapt(content: Any) throws -> Any
}
