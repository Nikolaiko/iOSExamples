//
//  AppUser.swift
//  GraphQLGit
//
//  Created by Nikolai Baklanov on 03.05.2023.
//

import Foundation

struct AppUser {
    static var currentUser: AppUser? = nil

    let id: String
    let name: String
    let login: String
    let bio: String
    let avatarUrl: String

    let followersTotalCount: Int
    let followingTotalCount: Int
    let starredRepositoriesCount: Int

    let repositoriesTotalCount: Int
    let starredRepositories: [RepositoryShortData]

    func copyWithRepositories(newRepositories: [RepositoryShortData]) -> AppUser {
        return AppUser(
            id: id,
            name: name,
            login: login,
            bio: bio,
            avatarUrl: avatarUrl,
            followersTotalCount: followersTotalCount,
            followingTotalCount: followingTotalCount,
            starredRepositoriesCount: starredRepositoriesCount,
            repositoriesTotalCount: repositoriesTotalCount,
            starredRepositories: newRepositories
        )
    }
}
