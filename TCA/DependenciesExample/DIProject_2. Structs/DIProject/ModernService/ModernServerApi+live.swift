//
//  ModernServerApi+live.swift
//  DIProject
//
//  Created by Nikolai Baklanov on 10.06.2024.
//

import Foundation
import Combine

extension ModernServerApi {
    static var live = Self(
        dataPublisger: {
            URLSession.shared.dataTaskPublisher(for: URL(string: "https://rickandmortyapi.com/api/character")!)
                .map { $0.data }
                .decode(type: ServerResponse.self, decoder: JSONDecoder())
                .map { $0.results }
                .replaceError(with: [])
                .eraseToAnyPublisher()
        }
    )
}
