//
//  ContentView.swift
//  NavigationExample
//
//  Created by Николай Бакланов on 18.04.2024.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    var body: some View {
        MainSimpleView(store: Store(initialState: SimpleWayReducer.State(), reducer: {
            SimpleWayReducer()
        }))
    }
}
