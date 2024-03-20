//
//  AppTabs.swift
//  AppIntentsStartup
//
//  Created by Nikolai Baklanov on 07.12.2023.
//

import Foundation
import AppIntents

enum AppTabs: String {
    case rickyCharacters
    case rickyEpisodes
    case rickyLocations
}

extension AppTabs: AppEnum {
    static var typeDisplayRepresentation: TypeDisplayRepresentation { "Вкладка" }
    static var typeDisplayName: LocalizedStringResource = "Вкладка"
    static var caseDisplayRepresentations: [AppTabs : DisplayRepresentation] = [
        .rickyCharacters : "Персонажи",
        .rickyEpisodes : "Эпизоды",
        .rickyLocations : "Локации"
    ]
}
