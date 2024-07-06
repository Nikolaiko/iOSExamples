//
//  ModernServerApi.swift
//  DIProject
//
//  Created by Nikolai Baklanov on 10.06.2024.
//

import Foundation
import Combine

struct ModernServerApi {
    var dataPublisger: (() -> AnyPublisher<[CartoonCharacter], Never>)

}
