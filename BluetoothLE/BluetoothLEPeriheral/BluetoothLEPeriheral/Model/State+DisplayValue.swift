//
//  State+DisplayValue.swift
//  BluetoothLEPeriheral
//
//  Created by Nikolai Baklanov on 12.05.2023.
//

import Foundation
import CoreBluetooth

extension CBManagerState {
    func displayValue() -> String {
        switch self {
        case .poweredOn:
            return "Включено"
        case .poweredOff:
            return "Выключено"
        case .unknown:
            return "Неизвестно"
        case .unsupported:
            return "Неподдерживается"
        case .unauthorized:
            return "Нет разрешения"
        case .resetting:
            return "Сбрасываем"
        default:
            return "ХЗ вообще"
        }
    }
}
