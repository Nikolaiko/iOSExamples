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
                FirstView()
            case .second:
                SecondView()
            case .third:
                ThirdView()
            }
            Button(action: {
                store.send(.setScreen(.second))
            }, label: {
                Text("Button")
            })
        }

    }
}
