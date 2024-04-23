//
//  AddItem.swift
//  NavigationExample
//
//  Created by Nikolai Baklanov on 23.04.2024.
//

import Foundation
import ComposableArchitecture

@Reducer
struct AddItemFeature {

    @ObservableState
    struct State {
        var title = "AddItemFeature"
    }
}
