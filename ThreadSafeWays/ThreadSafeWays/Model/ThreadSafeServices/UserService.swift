//
//  UserService.swift
//  ThreadSafeWays
//
//  Created by Nikolai Baklanov on 17.06.2023.
//

import Foundation

protocol UserService {
    func addUser(newUser: UserData)
    func printAll()
    func getMethodName() -> String
}
