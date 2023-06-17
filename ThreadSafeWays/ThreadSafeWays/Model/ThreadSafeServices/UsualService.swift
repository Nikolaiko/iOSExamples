//
//  UsualService.swift
//  ThreadSafeWays
//
//  Created by Nikolai Baklanov on 17.06.2023.
//

import Foundation

class UsualService: UserService {
    private var users: [Int : UserData] = [ : ]

    func addUser(newUser: UserData) {
        users[newUser.id] = newUser
    }

    func printAll() {
        print(users)
    }

    func getMethodName() -> String {
        return "Usual method"
    }
}
