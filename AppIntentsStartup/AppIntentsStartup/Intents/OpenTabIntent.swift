//
//  OpenTabIntent.swift
//  AppIntentsStartup
//
//  Created by Nikolai Baklanov on 20.03.2024.
//

import Foundation
import AppIntents

final class OpenTabIntent: AppIntent {
    static var title: LocalizedStringResource = "Отркыть вкладку в приложении"

    @Parameter(title: "Вкладка")
    var tab: AppTabs

    static var openAppWhenRun: Bool = true

    @MainActor
    func perform() async throws -> some IntentResult {
        Router.shared.moveToTab(tab: tab)
        return .result()
    }

    static var parameterSummary: some ParameterSummary {
        Summary("Отркыть \(\.$tab)")
    }

}
