//
//  CallbackTypes.swift
//  GraphQLGit
//
//  Created by Nikolai Baklanov on 03.05.2023.
//

import Foundation

typealias GraphQLCallback<T> = (T?, GraphQLError?) -> Void
