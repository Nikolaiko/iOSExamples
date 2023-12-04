//
//  ModelCharacter.swift
//  TransferableOwner
//
//  Created by Nikolai Baklanov on 20.07.2023.
//

import Foundation

extension ModelCharacter {
    func toRMProfile() -> RMProfile {
        RMProfile(id: id, name: name, avatar: image ?? "")
    }
}
