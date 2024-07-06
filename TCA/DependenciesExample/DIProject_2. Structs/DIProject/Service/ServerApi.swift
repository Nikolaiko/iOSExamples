//
//  ServerApi.swift
//  DIProject
//
//  Created by Nikolai Baklanov on 06.06.2024.
//

import Foundation
import Combine

protocol ServerApi {
    func getData()  -> AnyPublisher<[CartoonCharacter], Never>
}
