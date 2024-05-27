//
//  CounterFeature.swift
//  TCAOneDotNine
//
//  Created by Nikolai Baklanov on 28.03.2024.
//

import Foundation
import ComposableArchitecture

@Reducer
struct CounterFeature {

    @ObservableState
    struct State: Equatable {
        var counter: Int = 0
        var name: String
    }

    enum Action {
        case add
        case sub
    }

    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        switch action {
        case .add:
            state.counter += 1
            return .none
        case .sub:
            state.counter -= 1
            return .none
        }
    }
}
