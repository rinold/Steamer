//
//  YAMLDecoder+StringDecoder.swift
//  Steamer
//
//  Created by Mikhail Churbanov on 20/06/2018.
//

import Yams
import SwaggerParser

extension YAMLDecoder: StringDecoder {
    public func decode<T>(_ type: T.Type, from string: String) throws -> T where T : Decodable {
        return try self.decode(T.self, from: string, userInfo: [:])
    }
}
