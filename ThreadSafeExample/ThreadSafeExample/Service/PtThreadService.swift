//
//  PtThreadService.swift
//  ThreadSafeExample
//
//  Created by Nikolai Baklanov on 04.06.2023.
//

import Foundation

class PtThreadDataService: UserDataService {
    private var users: [Int : User] = [ : ]
    private var mutex = pthread_mutex_t()

    init() {
        pthread_mutex_init(&mutex, nil)
    }

    func addNewUser(newUser: User) {
        pthread_mutex_lock(&mutex)
        users[newUser.id] = newUser
        pthread_mutex_unlock(&mutex)
    }

    func printAll() {
        users.forEach { id, value in
            print("Id : \(id), user : \(value.name)")
        }
    }
}
