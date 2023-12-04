//
//  CharactersViewModel.swift
//  PagingNwtworkExample
//
//  Created by Nikolai Baklanov on 20.03.2023.
//

import Foundation
import SwiftUI

class CharactersViewModel: ObservableObject {
    private var page = 1

    var finished = false
    @Published var canLoad = true
    @Published var characters: [RMProfile] = []

    func fetch() {
        guard canLoad == true else { return }
        guard finished == false else { return }
        canLoad = false

        Task {
            do {
                let response = try await CharactersAPI.getAllCharacters(page: 1)
                DispatchQueue.main.async { [weak self] in
                    let mapped = (response.results ?? []).map { $0.toRMProfile() }
                    self?.characters.append(contentsOf: mapped)
                    self?.page += 1
                    self?.canLoad = true
                    self?.finished = response.info.next == nil
                }

            } catch {
                canLoad = true
            }
        }

    }
}
