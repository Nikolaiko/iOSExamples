//
//  ServerResponse.swift
//  DIProject
//
//  Created by Nikolai Baklanov on 06.06.2024.
//

import Foundation

public struct ServerResponse: Codable {
    public let results: [CartoonCharacter]

    public init(results: [CartoonCharacter]) {
        self.results = results
    }
}
