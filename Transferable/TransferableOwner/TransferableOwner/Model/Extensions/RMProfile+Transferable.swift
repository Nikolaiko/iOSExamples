//
//  RMProfile+Transferable.swift
//  TransferableOwner
//
//  Created by Nikolai Baklanov on 20.07.2023.
//

import Foundation
import CoreTransferable

extension RMProfile: Transferable {
    static var transferRepresentation: some TransferRepresentation {
        CodableRepresentation(contentType: .rmprofile)
        ProxyRepresentation(exporting: \.name)
    }
}
