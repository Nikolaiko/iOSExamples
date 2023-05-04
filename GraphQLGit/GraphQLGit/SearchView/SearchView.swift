//
//  SearchView.swift
//  GraphQLGit
//
//  Created by Nikolai Baklanov on 03.05.2023.
//

import SwiftUI
import SwiftDevPackage

struct SearchView: View {
    @StateObject var viewModel = SearchViewModel()
    @EnvironmentObject var navigation: NavigationControllerViewModel

    var body: some View {
        VStack {
            VStack {
                TextField(
                    "Введите запрос",
                    text: $viewModel.queryString
                )
                Button {
                    viewModel.search()
                } label: {
                    Text("Искать")
                }
                .disabled(viewModel.queryString.isEmpty)
            }
            Button {
                navigation.pop()
            } label: {
                Text("Назад")
            }
            List {
                ForEach(viewModel.repositories) { repo in
                    HStack {
                        Text(repo.name)
                        Text(String(repo.starsCount))
                        Button {
                            viewModel.toggle(repoId: repo.id)
                        } label: {
                            Text("Добавить/Убрать")
                        }
                        .disabled(!viewModel.canPerform)

                    }
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
