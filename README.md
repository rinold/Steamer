# Steamer

Command line tool for [Vapor](https://vapor.codes) stub (template) server generator from the [OpenAPI](https://openapis.org/) (Swagger) specification written in Swift.

### Targeted supported versions:
- Vapor 3
- OpenAPI 3.0.* ([Current latest - 3.0.1 Spec](https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.1.md))

### Goals
- Encourage the [API design first](https://swaggerhub.com/blog/api-design/design-first-or-code-first-api-development/) if it suits your needs!
- Make implementation and prototyping of RESTful servers using Vapor event more easier by minimising boilerplate coding
- Meet incredible and amazing Swift professionals who would like to join and contribute to this project! :)

### Features - TBD, starting list to think of...
- Generation of stubbed API server from OpenAPI document:
  - Controllers
  - Routing
  - Models
  - everything else needed to run
- Use Security Scheme definitions for authorization and authentification support
- Mock responses with data examples if provided
- Comments / documentation generation
- ...

### Contribution
Is welcome! Join and be the first one commiting real code! 

### Dependencies (Potential)
- [SwaggerParser](https://github.com/AttilaTheFun/SwaggerParser) - Swift library for parsing OpenAPI 2.0 (f.k.a. Swagger) documents into native structures (OpenAPI 3.0 support is "alpha"-ready, currently on [fork](https://github.com/rinold/SwaggerParser/tree/openapi-3)).
- [?] [Yams](https://github.com/jpsim/Yams) - A Sweet and Swifty YAML parser.
- [?] [Stencil](https://github.com/kylef/Stencil) / [Leaf](https://github.com/vapor/leaf) or ... - need to choose something for templating.
