//
//  ContentView.swift
//  TransferableOwner
//
//  Created by Nikolai Baklanov on 20.07.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { geom in
            HStack {
                ListView()
                    .frame(width: geom.size.width / 2)
                TargetView()
            }
        }
    }
}
