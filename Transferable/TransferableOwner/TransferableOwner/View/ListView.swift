//
//  ListView.swift
//  TransferableOwner
//
//  Created by Nikolai Baklanov on 20.07.2023.
//

import SwiftUI

struct ListView: View {
    @StateObject var viewModel = CharactersViewModel()

    var body: some View {
        List {
            ForEach(viewModel.characters) { character in
                HStack{
                    AsyncImage(
                        url: URL(string: character.avatar)
                    ) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }
                    Text(character.name)
                }
                .frame(height: 50)
                .draggable(character)
            }
        }
        .onAppear {
            viewModel.fetch()
        }
    }
}

