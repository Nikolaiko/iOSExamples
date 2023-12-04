//
//  ContentView.swift
//  TransferableImport
//
//  Created by Nikolai Baklanov on 13.04.2023.
//

import SwiftUI
import UniformTypeIdentifiers

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            PasteButton(
                supportedContentTypes: [UTType.characterProfile]
            ) { itemProviders in
                itemProviders.first!.loadDataRepresentation(forTypeIdentifier: UTType.characterProfile.identifier) { data, error in
                    print(data)
                    print(try! JSONDecoder().decode(MyCharacter.self, from: data!))
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
