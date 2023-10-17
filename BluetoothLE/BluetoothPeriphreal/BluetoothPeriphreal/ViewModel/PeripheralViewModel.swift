//
//  PeripheralViewModel.swift
//  BluetoothPeriphreal
//
//  Created by Nikolai Baklanov on 21.07.2023.
//

import Foundation
import SwiftUI
import CoreBluetooth

let initialServiceUUID = CBUUID.init(string: "b4250400-fb4b-4746-b2b0-93f0e61122c6")
let char1UUID = CBUUID.init(string: "b4250400-fb4b-4746-b2b0-00f0e61122c6")
let char2UUID = CBUUID.init(string: "b4250400-fb4b-4746-b2b0-02f0e61122c6")


class PeripheralViewModel: NSObject, ObservableObject, CBPeripheralDelegate, CBPeripheralManagerDelegate {

    @Published var advertisingError = ""
    @Published var state = ""

    @Published var readableChar = "initialValueRead"
    @Published var writeableChar = ""

    private var manager: CBPeripheralManager? = nil

    func initBluetooth() {
        manager = CBPeripheralManager(delegate: self, queue: nil)
    }

    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        switch peripheral.state {
        case .poweredOn:
            state = "poweredOn"
        case .poweredOff:
            state = "poweredOff"
        case .resetting:
            state = "resetting"
        case .unauthorized:
            state = "unauthorized"
        case .unknown:
            state = "unknown"
        case .unsupported:
            state = "unsupported"
        @unknown default:
            state = "unknown state"
        }
    }

    func startAdvertising() {

        let myService = CBMutableService(type: initialServiceUUID, primary: true)

        let char1 = CBMutableCharacteristic(
            type: char1UUID,
            properties: [.read],
            value: readableChar.data(using: .utf8),
            permissions: [.readable]
        )
        let char2 = CBMutableCharacteristic(
            type: char2UUID,
            properties: [.read, .write],
            value: nil,
            permissions: [.writeable]
        )

        myService.characteristics = [char1, char2]
        manager?.add(myService)

        manager?.startAdvertising(
            [
                CBAdvertisementDataLocalNameKey : "OTUS Peripheral",
                CBAdvertisementDataServiceUUIDsKey: [initialServiceUUID]
            ]
        )
    }

    func peripheralManager(_ peripheral: CBPeripheralManager, didReceiveRead request: CBATTRequest) {
        print("Readable Request : \(request)")
        manager?.respond(to: request, withResult: .success)
    }

    func peripheralManager(_ peripheral: CBPeripheralManager, didReceiveWrite requests: [CBATTRequest]) {
        guard let firstREquest = requests.first else { return }
        DispatchQueue.main.async {
            self.writeableChar = firstREquest.value?.hexEncodedString() ?? "Empty"
        }
    }

    func peripheralManagerDidStartAdvertising(_ peripheral: CBPeripheralManager, error: Error?) {
        DispatchQueue.main.async {
            self.advertisingError = error == nil ? "NoError" : error.debugDescription
        }
    }
}


extension Data {
 struct HexEncodingOptions: OptionSet {
     let rawValue: Int
     static let upperCase = HexEncodingOptions(rawValue: 1 << 0)
 }
 func hexEncodedString(options: HexEncodingOptions = []) -> String {
     let format = options.contains(.upperCase) ? "%02hhX" : "%02hhx"
     return map { String(format: format, $0) }.joined()
 }
}
