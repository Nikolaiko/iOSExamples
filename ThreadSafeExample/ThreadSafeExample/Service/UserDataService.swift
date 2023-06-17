//
//  UserDataService.swift
//  ThreadSafeExample
//
//  Created by Nikolai Baklanov on 04.06.2023.
//

import Foundation

protocol UserDataService {
    func addNewUser(newUser: User)
    func printAll()
}
