//
//  MainSimpleView.swift
//  NavigationExample
//
//  Created by Николай Бакланов on 19.04.2024.
//

import SwiftUI
import ComposableArchitecture

struct MainSimpleView: View {
    let store: StoreOf<SimpleWayReducer>

    var body: some View {
        VStack {
            switch store.selectedScreen {
            case .first:
                FirstView(store: store.scope(state: \.firstScreenState, action: \.firstAction))                
            case .second:
                SecondView(store: Store(initialState: SecondViewReducer.State(), reducer: {
                    SecondViewReducer()
                }))
            case .third:
                ThirdView(store: Store(initialState: ThirdViewReducer.State(), reducer: { ThirdViewReducer() }))
            }
            Button(action: {
                store.send(.setScreen(.second))
            }, label: {
                Text("Button")
            })
        }

    }
}
