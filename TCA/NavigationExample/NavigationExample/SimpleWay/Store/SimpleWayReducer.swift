//
//  SimpleWayReducer.swift
//  NavigationExample
//
//  Created by Nikolai Baklanov on 21.04.2024.
//

import Foundation
import ComposableArchitecture

@Reducer
struct SimpleWayReducer {

    @ObservableState
    struct State {
        var selectedScreen: SimpleWayTypes = .first
        var firstScreenValue: String = "firstScreenValue"
        var secondScreenValue: String = "secondScreenValue"
        var thirdScreenValue: String = "thirdScreenValue"
    }

    enum Action {
        case setScreen(SimpleWayTypes)
    }

    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .setScreen(let screenType):
            state.selectedScreen = screenType
            return .none
        }
    }
}
