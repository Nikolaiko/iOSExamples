//
//  DisplayCharacter.swift
//  AppIntentsStartup
//
//  Created by Николай Бакланов on 20.03.2024.
//

import Foundation
import AppIntents

final class DisplayCharacter: AppIntent {
    static var title: LocalizedStringResource = "Показать персонажа"

    @Parameter(title: "Персонаж")
    var person: RickyCharacter

    @MainActor
    func perform() async throws -> some IntentResult & ReturnsValue<RickyCharacter> {
        return .result(value: person)
    }

    static var parameterSummary: some ParameterSummary {
        Summary("Показать \(\.$person)")
    }

}
