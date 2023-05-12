//
//  BLEPeripheral.swift
//  BluetoothLEPeriheral
//
//  Created by Nikolai Baklanov on 12.05.2023.
//

import Foundation
import CoreBluetooth
import SwiftUI

class BLEPeripheralViewModel: NSObject, CBPeripheralManagerDelegate, ObservableObject {
    private static let id = "identificator"

    @Published var state: CBManagerState = .unknown

    private var advertisingServices = [
        CBAdvertisementDataServiceUUIDsKey : [primaryServiceUUID]
    ]

    private var readCharacteristic = CBMutableCharacteristic(
        type: readCharacteristicUUID,
        properties:[.read],
        value:BLEPeripheralViewModel.id.data(using: .utf8),
        permissions:[.readable]
    )

    private var transferCharacteristic = CBMutableCharacteristic(
        type: transferCharacteristicUUID,
        properties:[.notify, .writeWithoutResponse],
        value:nil,
        permissions:[.readable, .writeable]
    )

    private var primaryService = CBMutableService(type:primaryServiceUUID, primary:true)
    private var manager: CBPeripheralManager? = nil

    override init() {
        super.init()

        primaryService.characteristics = [readCharacteristic, transferCharacteristic]
        manager = CBPeripheralManager(delegate: self, queue: nil)        
    }

    @MainActor
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        state = peripheral.state
        if state == .poweredOn {
            manager?.add(primaryService)
        }
    }
}
