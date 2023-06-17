//
//  UsualDataService.swift
//  ThreadSafeExample
//
//  Created by Nikolai Baklanov on 04.06.2023.
//

import Foundation

class UsualDataService: UserDataService {
    private var users: [Int : User] = [ : ]

    func addNewUser(newUser: User) {
        users[newUser.id] = newUser
    }

    func printAll() {
        users.forEach { id, value in
            print("Id : \(id), user : \(value.name)")
        }
    }
}
