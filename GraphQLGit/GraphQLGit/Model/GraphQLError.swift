//
//  GraphQLError.swift
//  GraphQLGit
//
//  Created by Nikolai Baklanov on 03.05.2023.
//

import Foundation

enum GraphQLError: Error {
    case nilEntity
    case serverError(Error)
}
