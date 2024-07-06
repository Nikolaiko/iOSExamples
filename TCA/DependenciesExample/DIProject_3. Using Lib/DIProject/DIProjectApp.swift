//
//  DIProjectApp.swift
//  DIProject
//
//  Created by Nikolai Baklanov on 06.06.2024.
//

import SwiftUI
import CartoonCharactersScreen

@main
struct DIProjectApp: App {
    var body: some Scene {
        WindowGroup {
            CartoonCharactersView(
                viewModel: CartoonCharactersViewModel()
            )
        }
    }
}
