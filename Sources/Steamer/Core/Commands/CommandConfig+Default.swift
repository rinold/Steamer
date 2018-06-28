//
//  CommandConfig+Default.swift
//  Steamer
//
//  Created by Mikhail Churbanov on 28/06/2018.
//

import Command

extension CommandConfig {

    public static func `default`() -> CommandConfig {
        var config = CommandConfig()
        config.use(GenerateCommand.self, as: "cook", isDefault: true)
        return config
    }
    
}
