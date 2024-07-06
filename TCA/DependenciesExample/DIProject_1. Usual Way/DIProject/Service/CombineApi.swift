//
//  CartoonApi.swift
//  DIProject
//
//  Created by Nikolai Baklanov on 06.06.2024.
//

import Foundation
import Combine

struct CombineApi: ServerApi {
    func getData()  -> AnyPublisher<[CartoonCharacter], Never> {
        URLSession.shared.dataTaskPublisher(for: URL(string: "https://rickandmortyapi.com/api/character")!)
            .map { $0.data }
            .decode(type: ServerResponse.self, decoder: JSONDecoder())
            .map { $0.results }
            .replaceError(with: [])
            .eraseToAnyPublisher()
    }
}
