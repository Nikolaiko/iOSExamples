//
//  SimpleWayStore.swift
//  LiveExampleNavigation
//
//  Created by Nikolai Baklanov on 23.04.2024.
//

import Foundation
import ComposableArchitecture

@Reducer
struct SimpleWayStore {

    @ObservableState
    struct State {
        var selectedIndex = 0
    }

    enum Action {
        case selectScreen(Int)
    }

    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .selectScreen(let newIndex):
            state.selectedIndex = newIndex
            return .none
        }
    }
}
