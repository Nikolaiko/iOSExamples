//
//  AuthInterceptor.swift
//  GraphQLGit
//
//  Created by Nikolai Baklanov on 03.05.2023.
//

import Foundation
import Apollo
import ApolloAPI

class AuthInterceptor: ApolloInterceptor {

    func interceptAsync<Operation>(chain: Apollo.RequestChain, request: Apollo.HTTPRequest<Operation>, response: Apollo.HTTPResponse<Operation>?, completion: @escaping (Result<Apollo.GraphQLResult<Operation.Data>, Error>) -> Void) where Operation : ApolloAPI.GraphQLOperation {

        request.addHeader(name: "Authorization", value: "Bearer \(token)")
        chain.proceedAsync(request: request,
                           response: response,
                           completion: completion)

    }
}
