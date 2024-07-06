//
//  ModerServerApi+mocks.swift
//  DIProject
//
//  Created by Nikolai Baklanov on 10.06.2024.
//

import Foundation
import Combine

extension ModernServerApi {
    static var mockData = Self(
        dataPublisger: {
            Just([
                CartoonCharacter(id: 1, name: "Nikolai"),
                CartoonCharacter(id: 2, name: "Vasili")
            ]).eraseToAnyPublisher()
        }
    )

    static var empty = Self(
        dataPublisger: {
            Just([]).eraseToAnyPublisher()
        }
    )
}
