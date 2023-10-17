//
//  MyCharacter+Transferable.swift
//  TransferableImport
//
//  Created by Nikolai Baklanov on 20.07.2023.
//

import Foundation
import CoreTransferable


extension MyCharacter: Transferable {
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(contentType: .characterProfile)
        ProxyRepresentation(exporting: \.name)
    }
}
