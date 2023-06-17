//
//  SerialQueueService.swift
//  ThreadSafeWays
//
//  Created by Nikolai Baklanov on 17.06.2023.
//

import Foundation

class SerialQueueService: UserService {
    private var users: [Int : UserData] = [ : ]
    private var queue = DispatchQueue(label: "MyTest")

    func addUser(newUser: UserData) {
        queue.async {
            self.users[newUser.id] = newUser
        }
    }

    func printAll() {
        print(users)
    }

    func getMethodName() -> String {
        return "Serial Queue method"
    }
}

