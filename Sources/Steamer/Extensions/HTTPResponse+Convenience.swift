//
//  HTTPResponse+Convenience.swift
//  Steamer
//
//  Created by Mikhail Churbanov on 29/06/2018.
//

import HTTP

extension HTTPResponse {
    var isSuccessfull: Bool {
        switch status.code {
        case 200...299:
            return true
        default:
            return false
        }
    }
}
