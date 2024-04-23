//
//  DetailFeature.swift
//  NavigationExample
//
//  Created by Nikolai Baklanov on 23.04.2024.
//

import Foundation
import ComposableArchitecture

@Reducer
struct DetailFeature {

    @ObservableState
    struct State {
        var title = "DetailFeature"
    }
}
