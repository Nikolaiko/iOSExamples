//
//  ChildViewsReducers.swift
//  NavigationExample
//
//  Created by Nikolai Baklanov on 21.04.2024.
//

import Foundation
import ComposableArchitecture

@Reducer
struct FirstViewReducer {

    @ObservableState
    struct State {
        var firstScreenValue: String = "firstScreenValue"
    }

    enum Action {

    }

    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        return .none
    }
}

@Reducer
struct SceondViewReducer {

    @ObservableState
    struct State {
        var secondScreenValue: String = "secondScreenValue"
    }

    enum Action {

    }

    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        return .none
    }
}

@Reducer
struct ThirdViewReducer {

    @ObservableState
    struct State {
        var thirdScreenValue: String = "thirdScreenValue"
    }

    enum Action {

    }

    func reduce(into state: inout State, action: Action) -> Effect<Action> {
        return .none
    }
}
