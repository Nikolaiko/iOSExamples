//
//  ProfileViewModel.swift
//  GraphQLGit
//
//  Created by Nikolai Baklanov on 03.05.2023.
//

import Foundation
import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var user: AppUser? = nil

    func fetchData() {
        GraphQLClient.instance.fetchAppUserData { appUser, error in
            guard error == nil && appUser != nil else {
                print("Error during getting user app : \(error)")
                return
            }

            DispatchQueue.main.async {
                AppUser.currentUser = appUser
                self.user = appUser
                print(self.user)
            }
        }
    }
}
