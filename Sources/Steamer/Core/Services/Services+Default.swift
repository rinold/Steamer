//
//  Services+Default.swift
//  Steamer
//
//  Created by Mikhail Churbanov on 28/06/2018.
//

import Command

extension Services {

    public static func `default`() -> Services {
        var services = Services()

        // console
        services.register(Console.self) { container -> Terminal in
            return Terminal()
        }

        // commands
        services.register(GenerateCommand.self)
        services.register { container -> CommandConfig in
            return .default()
        }
        services.register { container -> Commands in
            return try container.make(CommandConfig.self).resolve(for: container)
        }

        // document readers
        services.register(FileContentProvider.self)
        services.register(HttpContentProvider.self)
        services.register { container -> ContentProviders in
            let providers = ContentProviders(container: container)
            try providers.register(FileContentProvider.self)
            try providers.register(HttpContentProvider.self)
            return providers
        }

        return services
    }
    
}

extension Terminal: Service { }
