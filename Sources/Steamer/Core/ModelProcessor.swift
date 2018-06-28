////
////  ModelProcessor.swift
////  Steamer
////
////  Created by Mikhail Churbanov on 21/06/2018.
////
//
//import Foundation
//import OpenAPI3
//import Leaf
//
//class ModelProcessor: Processor {
//
//    let steamer: Steamer
//    let renderer: LeafRenderer
//
//    init(context: Steamer) {
//        steamer = context
//        let templatesUrl = Bundle.main.resourceURL!.appendingPathComponent("Templates")
//        let config = LeafConfig(tags: .default(), viewsDir: templatesUrl.path, shouldCache: true)
//        renderer = LeafRenderer(config: config, using: context.container)
//    }
//    
//    func process(document: OpenAPI3, session: SessionContext) {
//        if let schemas = document.components?.schemas {
//            for (name, schema) in schemas {
//                print (name)
//                let shema = schema.structure.type
//                switch shema {
//                case .object(_):
//                    renderer.render("Model", session).do { view in
//                        let modelFileUrl = URL(fileURLWithPath: "/Users/mikhailchurbanov/Documents/\(name).swift")
//                        try! view.data.write(to: modelFileUrl)
//                    }.catch { error in
//                        // todo
//                    }
//                default:
//                    // TODO
//                    break
//                }
//            }
//        }
//    }
//}
