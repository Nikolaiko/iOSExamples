//
//  ContentView.swift
//  TCAOneDotNine
//
//  Created by Nikolai Baklanov on 28.03.2024.
//

import SwiftUI
import ComposableArchitecture
import Perception

struct ContentView: View {
    var store: StoreOf<CounterFeature>

    var body: some View {
        VStack {
            Text("Counter : \(store.counter)")
            Button(action: {
                store.send(.add)
            }, label: {
                Text("Button1")
            })
            Button(action: {
                store.send(.sub)
            }, label: {
                Text("Button2")
            })
        }
        .padding()
    }
}

