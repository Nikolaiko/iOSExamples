//
//  ProfileView.swift
//  GraphQLGit
//
//  Created by Nikolai Baklanov on 03.05.2023.
//

import SwiftUI
import SwiftDevPackage

struct ProfileView: View {
    @EnvironmentObject var navigation: NavigationControllerViewModel
    @StateObject var viewModel = ProfileViewModel()

    var body: some View {
        VStack {
            Button {
                navigation.pop()
            } label: {
                Text("Назад")
            }

            if viewModel.user != nil {
                VStack {
                    Text("Name : \(viewModel.user?.name ?? "")")
                    Text("Bio : \(viewModel.user?.bio ?? "")")
                    AsyncImage(url: URL(string: viewModel.user?.avatarUrl ?? ""))
                    Text("Followers : \(viewModel.user?.followersTotalCount ?? 0)")
                    Text("Following : \(viewModel.user?.followingTotalCount ?? 0)")
                }
            }
        }
        .onAppear {
            viewModel.fetchData()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
