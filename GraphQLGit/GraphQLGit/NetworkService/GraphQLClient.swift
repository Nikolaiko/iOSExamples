//
//  GraphQLClient.swift
//  GraphQLGit
//
//  Created by Nikolai Baklanov on 03.05.2023.
//

import Foundation
import Apollo
import GitHubGraphQL

class GraphQLClient {

    public static let instance = GraphQLClient()

    private let apolloClient: ApolloClient

    private init() {
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)

        let client = URLSessionClient()
        let provider = AuthInterceptorProvider(store: store, client: client)
        let url = URL(string: "https://api.github.com/graphql")!

        let requestChainTransport = RequestChainNetworkTransport(
            interceptorProvider: provider,
            endpointURL: url
        )
        apolloClient = ApolloClient(networkTransport: requestChainTransport, store: store)
    }

    func fetchRepositories(queryString: String, responseCallback: @escaping GraphQLCallback<Array<RepositoryData>>) {
        apolloClient.fetch(
            query: FindRepositoriesQuery(query: queryString),
            cachePolicy: .fetchIgnoringCacheCompletely
        ) { result in
            switch result {
            case .success(let resultData):
                if let responseRepositories = resultData.data?.search.nodes {
                    let repositories: [RepositoryData] = responseRepositories.map { repo in
                        repo!.asRepository!.toDomain()
                    }
                    responseCallback(repositories, nil)
                } else {
                    responseCallback(nil, GraphQLError.nilEntity)
                }
            case .failure(let error):
                responseCallback(nil, GraphQLError.serverError(error))
            }
        }
    }

    func fetchAppUserData(responseCallback: @escaping GraphQLCallback<AppUser>) {
        apolloClient.fetch(
            query: FinadAppUserQuery(loginName: appUserName),
            cachePolicy: .fetchIgnoringCacheCompletely
        ) { result in
            switch result {
            case .success(let resultData):
                if let responseUser = resultData.data?.user {
                    let newUser = responseUser.toDomain()                    
                    self.fetchStarredRepositoriesForAppUser(user: newUser, responseCallback: responseCallback)
                } else {
                    responseCallback(nil, GraphQLError.nilEntity)
                }
            case .failure(let error):
                responseCallback(nil, GraphQLError.serverError(error))
            }
        }
    }

    func addStar(
        repoId: String,
        responseCallback: @escaping GraphQLCallback<Bool>
    ) {
        apolloClient.perform(mutation: AddStarMutation(repoId: repoId)) { result in
            switch result {
            case .success:
                responseCallback(true, nil)
            case .failure(let error):
                responseCallback(nil, GraphQLError.serverError(error))
            }
        }
    }

    func removeStar(
        repoId: String,
        responseCallback: @escaping GraphQLCallback<Bool>
    ) {
        apolloClient.perform(mutation: RemoveStarMutation(repoId: repoId)) { result in
            switch result {
            case .success:
                responseCallback(true, nil)
            case .failure(let error):
                responseCallback(nil, GraphQLError.serverError(error))
            }
        }
    }

    private func fetchStarredRepositoriesForAppUser(
        user: AppUser,
        responseCallback: @escaping GraphQLCallback<AppUser>
    ) {
        apolloClient.fetch(query: GetStarredRepositoriesQuery(
            loginName: appUserName,
            count: user.starredRepositoriesCount)
        ) { result in
            switch result {
            case .success(let resultData):
                if let responseRepos = resultData.data?.user?.starredRepositories {
                    let repos: [RepositoryShortData] = responseRepos.nodes?.map { r in
                        RepositoryShortData(id: r?.id ?? "", name: r?.name ?? "")
                    } ?? []
                    let newUser = user.copyWithRepositories(newRepositories: repos)
                    responseCallback(newUser, nil)
                } else {
                    responseCallback(nil, GraphQLError.nilEntity)
                }
            case .failure(let error):
                responseCallback(nil, GraphQLError.serverError(error))
            }
        }
    }

}
