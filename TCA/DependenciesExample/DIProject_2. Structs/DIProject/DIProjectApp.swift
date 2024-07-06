//
//  DIProjectApp.swift
//  DIProject
//
//  Created by Nikolai Baklanov on 06.06.2024.
//

import SwiftUI

@main
struct DIProjectApp: App {
    var body: some Scene {
        WindowGroup {
            CartoonCharactersView(
                viewModel: CartoonCharactersViewModel(
                    api: ModernServerApi.live,
                    manager: ModernWiFiMonitor.live
                )
            )
        }
    }
}
