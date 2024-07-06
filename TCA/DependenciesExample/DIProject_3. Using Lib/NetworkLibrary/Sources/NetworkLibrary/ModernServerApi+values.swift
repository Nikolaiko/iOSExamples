//
//  ModernServerApi+live.swift
//  DIProject
//
//  Created by Nikolai Baklanov on 10.06.2024.
//

import Foundation
import Combine
import Dependencies

extension ModernServerApi: DependencyKey {
    public static var liveValue = Self(
        dataPublisger: {
            URLSession.shared.dataTaskPublisher(for: URL(string: "https://rickandmortyapi.com/api/character")!)
                .map { $0.data }
                .decode(type: ServerResponse.self, decoder: JSONDecoder())
                .map { $0.results }
                .replaceError(with: [])
                .eraseToAnyPublisher()
        }
    )

    public static var previewValue = Self(
        dataPublisger: {
            Just([
                CartoonCharacter(id: 1, name: "Nikolai"),
                CartoonCharacter(id: 2, name: "Vasili")
            ]).eraseToAnyPublisher()
        }
    )
}
