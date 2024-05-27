//
//  SimpleWayParentView.swift
//  LiveExampleNavigation
//
//  Created by Nikolai Baklanov on 23.04.2024.
//

import SwiftUI
import ComposableArchitecture

struct SimpleWayParentView: View {
    let store: StoreOf<SimpleWayStore>

    var body: some View {
        VStack {
            if store.selectedIndex == 0 {
                SimpleWayFirst(
                    store: Store(initialState: SimpleWayFirstChild.State(),
                                 reducer: { SimpleWayFirstChild() })
                )
            } else {
                SimpleWaySecond(
                    store: Store(
                        initialState: SimpleWaySecondChild.State(),
                        reducer: { SimpleWaySecondChild()  })
                )
            }

            Button(action: {
                store.send(.selectScreen(1))
            }, label: {
                Text("Button")
            })
        }
    }
}

