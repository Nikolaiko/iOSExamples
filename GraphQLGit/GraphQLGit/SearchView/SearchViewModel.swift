//
//  SearchViewModel.swift
//  GraphQLGit
//
//  Created by Nikolai Baklanov on 03.05.2023.
//

import Foundation
import SwiftUI

class SearchViewModel: ObservableObject {
    @Published var canPerform = true
    @Published var queryString = ""
    @Published var repositories: [RepositoryData] = []

    func search() {
        GraphQLClient.instance.fetchRepositories(queryString: queryString) { repos, error in
            guard error == nil && repos != nil else {
                print("Error during getting search results : \(error)")
                return
            }

            DispatchQueue.main.async {
                self.repositories = repos ?? []
                print("READY SEARCH!!!")
            }
        }
    }

    func toggle(repoId: String) {
        guard canPerform else { return }

        let alreadyStarred: RepositoryShortData? = AppUser.currentUser?.starredRepositories.first(where: { data in
            data.id == repoId
        })        

        if alreadyStarred == nil {
            GraphQLClient.instance.addStar(repoId: repoId, responseCallback: starResult)
            canPerform = false
        } else {
            GraphQLClient.instance.removeStar(repoId: repoId, responseCallback: starResult)
            canPerform = false
        }
    }

    private func starResult(result: Bool?, error: GraphQLError?) {
        guard error == nil else {
            canPerform = true
            print("Error during starring repo : \(error)")
            return
        }
        search()
        updateUserData()
    }

    func updateUserData() {
        GraphQLClient.instance.fetchAppUserData { appUser, error in
            guard error == nil && appUser != nil else {
                print("Error during getting user app : \(error)")
                self.canPerform = true
                return
            }
            AppUser.currentUser = appUser
            self.canPerform = true
            print("READY UPDATE!!!")
        }
    }
}
