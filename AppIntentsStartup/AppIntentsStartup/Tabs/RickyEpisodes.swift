//
//  RickyEpisodes.swift
//  AppIntentsStartup
//
//  Created by Nikolai Baklanov on 07.12.2023.
//

import SwiftUI

struct RickyEpisodes: View {
    var body: some View {
        Button(action: {
            Router.shared.moveToTab(tab: .rickyCharacters)
        }, label: {
            Text("Button")
        })
    }
}

#Preview {
    RickyEpisodes()
}
