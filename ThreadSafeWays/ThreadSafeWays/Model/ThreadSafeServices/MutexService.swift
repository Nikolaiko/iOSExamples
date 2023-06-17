//
//  MutexService.swift
//  ThreadSafeWays
//
//  Created by Nikolai Baklanov on 17.06.2023.
//

import Foundation

class MutexService: UserService {
    private var users: [Int : UserData] = [ : ]
    private var mutex = pthread_mutex_t()

    init() {
        pthread_mutex_init(&mutex, nil)
    }

    func addUser(newUser: UserData) {
        pthread_mutex_lock(&mutex)
        users[newUser.id] = newUser
        pthread_mutex_unlock(&mutex)
    }

    func printAll() {
        print(users)
    }

    func getMethodName() -> String {
        return "Mutex method"
    }
}

