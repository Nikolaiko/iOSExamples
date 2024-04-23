//
//  NavigationStoreRootFeature.swift
//  NavigationExample
//
//  Created by Nikolai Baklanov on 23.04.2024.
//

import Foundation
import ComposableArchitecture

@Reducer
struct NavigationStoreRootFeature {

    @ObservableState
    struct State {
        var path = StackState<Path.State>()
    }

    enum Action {
        case path(StackActionOf<Path>)        
    }

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .path(.element(id: _, action: .description(.descTapped))):
                return .none
            }
        }
        .forEach(\.path, action: \.path)
      }

    @Reducer
    enum Path {
        case addFeature(AddItemFeature)
        case details(DetailFeature)
        case description(DescriptionFeature)
    }
}
