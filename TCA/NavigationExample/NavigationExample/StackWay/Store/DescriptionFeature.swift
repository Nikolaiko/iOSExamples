//
//  DescriptionFeature.swift
//  NavigationExample
//
//  Created by Nikolai Baklanov on 23.04.2024.
//

import Foundation
import ComposableArchitecture

@Reducer
struct DescriptionFeature {
    
    @ObservableState
    struct State {
        var title = "DescriptionFeature"
    }

    enum Action {
        case descTapped
    }
}
