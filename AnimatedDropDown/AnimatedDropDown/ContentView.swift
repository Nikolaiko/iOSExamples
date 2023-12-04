//
//  ContentView.swift
//  AnimatedDropDown
//
//  Created by Nikolai Baklanov on 07.07.2023.
//

import SwiftUI

struct ContentView: View {
    @State var selected = "Easy"

    var body: some View {
        VStack {
            Text("Another Item")
            Text("Another Item")
            Text("Another Item")
            Text("Another Item")
            DropDownView(
                selected: $selected,
                content: items,
                activeTint: .primary.opacity(0.1),
                inActiveTint: .white.opacity(1.0),
                dynamic: false
            )
            .frame(width: 140)
            Text("Another Item")
            Text("Another Item")
            Text("Another Item")
            Text("Another Item")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
