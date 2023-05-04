//
//  GraphQLExtensions.swift
//  GraphQLGit
//
//  Created by Nikolai Baklanov on 03.05.2023.
//

import Foundation
import GitHubGraphQL

extension FinadAppUserQuery.Data.User {
    func toDomain() -> AppUser {
        return AppUser(
            id: self.id,
            name: self.name ?? "",
            login: self.login,
            bio: self.bio ?? "",
            avatarUrl: self.avatarUrl,
            followersTotalCount: self.followers.totalCount,
            followingTotalCount: self.following.totalCount,
            starredRepositoriesCount: self.starredRepositories.totalCount,
            repositoriesTotalCount: self.repositories.totalCount,
            starredRepositories: []
        )
    }
}

extension FindRepositoriesQuery.Data.Search.Node.AsRepository {
    func toDomain() -> RepositoryData {
        return RepositoryData(id: self.id, name: self.name, starsCount: self.stargazerCount)
    }
}
