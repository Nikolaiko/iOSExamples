//
//  SimpleIntent.swift
//  AppIntentsStartup
//
//  Created by Nikolai Baklanov on 07.12.2023.
//

import Foundation
import AppIntents

final class SimpleIntent: AppIntent {
    static var title: LocalizedStringResource = "Navigate to characters"

    static var openAppWhenRun: Bool = true

    @MainActor
    func perform() async throws -> some IntentResult {
        Router.shared.moveToTab(tab: .rickyCharacters)
        return .result()
    }

}
