/*
 Usually when you buy something, you're asked whether your credit card number, phone number or answer to your most secret question is still correct. However, since someone could look over your shoulder, you don't want that shown on your screen. Instead, we mask it.

 Your task is to write a function maskify, which changes all but the last four characters into '#'.

 */

import Foundation

func maskify(_ string:String) -> String {
    let intIndex = max(0, string.count - 4)
    let index = string.index(string.startIndex, offsetBy: intIndex)
    return String(repeating: "#", count: intIndex) + string[index...]
}

print(maskify("4556364607935616"))
print(maskify("1"))
print(maskify(""))
