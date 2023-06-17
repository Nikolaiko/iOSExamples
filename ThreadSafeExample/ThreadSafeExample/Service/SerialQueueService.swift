//
//  SerialQueueService.swift
//  ThreadSafeExample
//
//  Created by Nikolai Baklanov on 17.06.2023.
//

import Foundation

class SerialQueueService: UserDataService {
    private var users: [Int : User] = [ : ]
    private let queue = DispatchQueue.global()

    func addNewUser(newUser: User) {
        queue.async {
            self.users[newUser.id] = newUser
        }
    }

    func printAll() {
        users.forEach { id, value in
            print("Id : \(id), user : \(value.name)")
        }
    }
}

class BarrierService: UserDataService {
    private var users: [Int : User] = [ : ]
    private let queue = DispatchQueue(label: "MyQueue", attributes: .concurrent)

    func addNewUser(newUser: User) {
        queue.async(flags: .barrier) {
            self.users[newUser.id] = newUser
        }
    }

    func printAll() {
        users.forEach { id, value in
            print("Id : \(id), user : \(value.name)")
        }
    }
}
