//
//  OnBoardingStore.swift
//  LiveExampleNavigation
//
//  Created by Nikolai Baklanov on 23.04.2024.
//

import Foundation
import ComposableArchitecture

@Reducer
struct OnBoardingStore {
    
    @ObservableState
    struct State {
        var title = "OnBoardingStore"
    }
    
    enum Action {
        case nextPage
        case prevPage
        case skip
    }

    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .nextPage:
            print("Child next")
            return .none
        case .prevPage:
            print("Child prev")
            return .none
        default:
            return .none
        }
    }
}
