//
//  AuthInterceptorProvider.swift
//  GraphQLGit
//
//  Created by Nikolai Baklanov on 03.05.2023.
//

import Foundation
import Apollo
import ApolloAPI

class AuthInterceptorProvider: InterceptorProvider {

    private let store: ApolloStore
      private let client: URLSessionClient

      init(store: ApolloStore, client: URLSessionClient) {
        self.store = store
        self.client = client
      }

    func interceptors<Operation>(for operation: Operation) -> [Apollo.ApolloInterceptor] where Operation : ApolloAPI.GraphQLOperation {
        return [
              MaxRetryInterceptor(),
              CacheReadInterceptor(store: self.store),
              AuthInterceptor(),
              NetworkFetchInterceptor(client: self.client),
              JSONResponseParsingInterceptor(),
              AutomaticPersistedQueryInterceptor(),
              CacheWriteInterceptor(store: self.store)
            ]
    }
}
