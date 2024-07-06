//
//  CartoonCharacter.swift
//  DIProject
//
//  Created by Nikolai Baklanov on 06.06.2024.
//

import Foundation

public struct CartoonCharacter: Codable, Identifiable {
    public let id: Int
    public let name: String

    public init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}
