//
//  WeatheriOSAppApp.swift
//  WheatherWatchApp WatchKit Extension
//
//  Created by Nikolai Baklanov on 17.06.2022.
//

import SwiftUI

@main
struct WeatheriOSAppApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
