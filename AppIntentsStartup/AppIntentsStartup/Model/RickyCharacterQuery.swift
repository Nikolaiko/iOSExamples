//
//  RickyCharacterQuery.swift
//  AppIntentsStartup
//
//  Created by Николай Бакланов on 20.03.2024.
//

import Foundation
import AppIntents

struct RickyCharacterQuery: EntityQuery {
    
    func entities(for identifiers: [RickyCharacter.ID]) async throws -> [RickyCharacter] {
        return [RickyCharacter(id: 2, name: "Morty", url: "https://rickandmortyapi.com/api/character/avatar/2.jpeg", origin: "unknown")]
    }
    
    func suggestedEntities() async throws -> [RickyCharacter] {
        [
            RickyCharacter(id: 1, name: "Ricky", url: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", origin: "Earth (C-137)"),
            RickyCharacter(id: 2, name: "Morty", url: "https://rickandmortyapi.com/api/character/avatar/2.jpeg", origin: "unknown"),
            RickyCharacter(id: 3, name: "Summer Smith", url: "https://rickandmortyapi.com/api/character/avatar/3.jpeg", origin: "unknown")
        ]
    }
}
