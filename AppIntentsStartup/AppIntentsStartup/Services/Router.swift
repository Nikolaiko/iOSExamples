//
//  Router.swift
//  AppIntentsStartup
//
//  Created by Nikolai Baklanov on 07.12.2023.
//

import Foundation
import Combine

class Router {

    static let shared = Router()

    public let currentTab: CurrentValueSubject<AppTabs, Never> = CurrentValueSubject(.rickyEpisodes)

    private init() { }
    
    func moveToTab(tab: AppTabs) {
        currentTab.send(tab)
    }

}
