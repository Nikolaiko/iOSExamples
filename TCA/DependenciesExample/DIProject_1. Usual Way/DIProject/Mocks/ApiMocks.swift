//
//  ApiMocks.swift
//  DIProject
//
//  Created by Nikolai Baklanov on 06.06.2024.
//

import Foundation
import Combine

struct EmptyServerResponse: ServerApi {
    func getData() -> AnyPublisher<[CartoonCharacter], Never> {
        Just([]).eraseToAnyPublisher()
    }
}

struct DoomyServerResponse: ServerApi {
    func getData() -> AnyPublisher<[CartoonCharacter], Never> {
        Just([
            CartoonCharacter(id: 1, name: "Nikolai"),
            CartoonCharacter(id: 2, name: "Vasili")
        ]).eraseToAnyPublisher()
    }
}
