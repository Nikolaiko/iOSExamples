//
//  RickyIntentProvider.swift
//  AppIntentsStartup
//
//  Created by Nikolai Baklanov on 07.12.2023.
//

import Foundation
import AppIntents

struct RickyIntentProvider: AppShortcutsProvider {
    static var appShortcuts: [AppShortcut] {
        AppShortcut(
            intent: SimpleIntent(),
            phrases: ["Открыть список персонажей"],
            shortTitle: "Test Ricky Navigation",
            systemImageName: "books.vertical.fill"
        )

        AppShortcut(
            intent: OpenTabIntent(),
            phrases: ["Открыть вкладку"],
            shortTitle: "Открыть произвольную влкадку",
            systemImageName: "books.vertical.fill"
        )
    }
}
