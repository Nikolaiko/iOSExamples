//
//  TreeBasedStore.swift
//  LiveExampleNavigation
//
//  Created by Nikolai Baklanov on 23.04.2024.
//

import Foundation
import ComposableArchitecture

@Reducer
struct TreeBasedStore {
    
    @ObservableState
    struct State {
        var isLoading = false
        var loadedCharacters: [ModelCharacter] = []
        
    }

    enum Action {
        case loadData
        case resultData([ModelCharacter])
    }

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .loadData:
                state.isLoading = true
                return .run { send in
                    let result = try? await CharactersAPI.getAllCharacters(page: 1)                    
                    let data = result?.results ?? []

                    await send(.resultData(data))
                }
            case .resultData(let data):
                state.loadedCharacters = data
                state.isLoading = false
                return .none
            }
        }
    }
}
