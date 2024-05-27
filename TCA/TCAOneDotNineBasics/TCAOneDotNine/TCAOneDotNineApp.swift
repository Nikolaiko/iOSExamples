//
//  TCAOneDotNineApp.swift
//  TCAOneDotNine
//
//  Created by Nikolai Baklanov on 28.03.2024.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCAOneDotNineApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(
                store: Store(initialState: CounterFeature.State(name: "temp"), reducer: {
                    CounterFeature()
                })
            )
        }
    }
}
