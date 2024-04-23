//
//  FirstView.swift
//  NavigationExample
//
//  Created by Николай Бакланов on 19.04.2024.
//

import SwiftUI
import ComposableArchitecture

struct FirstView: View {
    let store: StoreOf<FirstViewReducer>

    var body: some View {
        VStack {
            Text(store.firstScreenValue)
            Button(action: {
                store.send(.someAction)
            }, label: {
                Text("Button 1")
            })
            Button(action: {
                store.send(.otherAction)
            }, label: {
                Text("Button 2")
            })
        }

    }
}
