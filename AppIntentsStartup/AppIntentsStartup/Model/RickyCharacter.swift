//
//  RickyCharacter.swift
//  AppIntentsStartup
//
//  Created by Николай Бакланов on 20.03.2024.
//

import Foundation
import AppIntents

struct RickyCharacter: Identifiable, AppEntity {
    static var typeDisplayRepresentation: TypeDisplayRepresentation = "Person"
    
    var displayRepresentation: DisplayRepresentation {
        DisplayRepresentation(title: "\(name)")
    }
    
    let id: Int
    let name: String
    let url: String
    let origin: String
    
    static var defaultQuery = RickyCharacterQuery()
}
