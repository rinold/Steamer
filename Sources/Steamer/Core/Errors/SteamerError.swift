//
//  SteamerError.swift
//  Steamer
//
//  Created by Mikhail Churbanov on 28/06/2018.
//

struct SteamerError: Error {
    let description: String
}

extension SteamerError {
    init() {
        description = "Unknown error, thrown by lazy programmer :'("
    }
}
