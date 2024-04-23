//
//  SimpleWayReducer.swift
//  NavigationExample
//
//  Created by Nikolai Baklanov on 21.04.2024.
//

import Foundation
import ComposableArchitecture

@Reducer
struct SimpleWayReducer: Reducer {

    @ObservableState
    struct State {
        var selectedScreen: SimpleWayTypes = .first
        var firstScreenState: FirstViewReducer.State = FirstViewReducer.State()
        var secondScreenValue: String = "secondScreenValue"
        var thirdScreenValue: String = "thirdScreenValue"
    }

    enum Action {
        case setScreen(SimpleWayTypes)
        case firstAction(FirstViewReducer.Action)        
    }

    var body: some ReducerOf<Self> {
        Scope(state: \.firstScreenState, action: \.firstAction) {
            FirstViewReducer()
        }
        Reduce { state, action in
            switch action {
            case .setScreen(let screenType):
                state.selectedScreen = screenType
                return .none
            default:
                return .none
            }
        }
    }
}
