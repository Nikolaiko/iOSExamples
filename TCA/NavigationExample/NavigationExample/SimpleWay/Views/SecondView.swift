//
//  SecondView.swift
//  NavigationExample
//
//  Created by Николай Бакланов on 19.04.2024.
//

import SwiftUI
import ComposableArchitecture

struct SecondView: View {
    let store: StoreOf<SecondViewReducer>
    
    var body: some View {
        Text(store.secondScreenValue)
    }
}
