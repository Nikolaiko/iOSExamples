//
//  ViewModel.swift
//  AppIntentsStartup
//
//  Created by Nikolai Baklanov on 07.12.2023.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    @Published var currentTab: AppTabs = .rickyEpisodes
    private var subs: Set<AnyCancellable> = Set()

    init() {
        Router.shared.currentTab.sink { newTab in
            DispatchQueue.main.async {
                self.currentTab = newTab
            }
        }.store(in: &subs)
    }
}
