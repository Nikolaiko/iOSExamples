//
//  ScopeExampleStore.swift
//  LiveExampleNavigation
//
//  Created by Nikolai Baklanov on 23.04.2024.
//

import Foundation
import ComposableArchitecture

@Reducer
struct ScopeExampleStore {

    @ObservableState
    struct State {
        var onBoardingCompleted = false
        var onBoardingState = OnBoardingStore.State()
        var mainScreenState = MainScreenStore.State()
    }

    enum Action {
        case onBoardingAction(OnBoardingStore.Action)
        case mainScreenAction(MainScreenStore.Action)
        case checkOnBoaringComplete
    }

    var body: some ReducerOf<Self> {
        Scope(state: \.onBoardingState, action: \.onBoardingAction) {
            OnBoardingStore()
        }
        Reduce { state, action in
            switch action {
            case .checkOnBoaringComplete:
                state.onBoardingCompleted = false
                return .none
            default:
                return .none
            }
        }
    }
}
