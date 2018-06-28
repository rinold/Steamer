//
//  String+HTTPScheme.swift
//  Steamer
//
//  Created by Mikhail Churbanov on 28/06/2018.
//

import HTTP

extension String {

    var convertToHttpScheme: HTTPScheme? {
        switch self {
        case "http":
            return .https
        case "https":
            return .https
        case "ws":
            return .ws
        case "wss":
            return .wss
        default:
            return nil
        }
    }
    
}
