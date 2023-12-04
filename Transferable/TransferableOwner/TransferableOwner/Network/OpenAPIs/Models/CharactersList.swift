//
// CharactersList.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

public struct CharactersList: Codable, JSONEncodable, Hashable {

    public var info: Info
    public var results: [ModelCharacter]?

    public init(info: Info, results: [ModelCharacter]? = nil) {
        self.info = info
        self.results = results
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case info
        case results
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(info, forKey: .info)
        try container.encodeIfPresent(results, forKey: .results)
    }
}

