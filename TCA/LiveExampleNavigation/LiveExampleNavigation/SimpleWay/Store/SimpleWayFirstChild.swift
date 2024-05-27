//
//  SimpleWayFirstChild.swift
//  LiveExampleNavigation
//
//  Created by Nikolai Baklanov on 23.04.2024.
//

import Foundation
import ComposableArchitecture

@Reducer
struct SimpleWayFirstChild {
    
    @ObservableState
    struct State {
        var title = "SimpleWayFirstChild"
    }
}
