//
//  MainScreenStore.swift
//  LiveExampleNavigation
//
//  Created by Nikolai Baklanov on 23.04.2024.
//

import Foundation
import ComposableArchitecture

@Reducer
struct MainScreenStore {

    @ObservableState
    struct State {
        var title = "MainScreenStore"
    }

    enum Action {
        case nextTab
        case prevTab
    }
}
