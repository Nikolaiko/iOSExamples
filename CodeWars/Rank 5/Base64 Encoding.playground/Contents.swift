import Foundation

/*

 Base64 encoding lets you represent arbitrary binary data as ASCII-safe text. Your task is to provide both the encoder and decoder to convert to and from Base64.

 Create two functions that can convert from binary data to a Base64 encoded string, and vice versa:

 func toBase64(_ data: [UInt8]) -> String
 func fromBase64(_ encoded: String) -> [UInt8]
 While many Base64 implementations use = padding characters, your functions should not use padding.

 Can you come up with your own encoder and decoder rather than use your language's base64 implementation?

 Example (input -> output):
 b'this is a bytestring!' -> "dGhpcyBpcyBhIGJ5dGVzdHJpbmch"
 b'\x00' -> "AA"

 */

let firstMask:UInt32 = UInt32(63) << 26
let secondMask:UInt32 = UInt32(63) << 20
let thirdMask:UInt32 = UInt32(63) << 14
let fourthMask:UInt32 = UInt32(63) << 8

let charactersTable = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
let firstExample = "MTIzNDU2Nzg5MA"
let secondExample = "now is the time for all good men to come to the aid of their country."

let firstResult = fromBase64(firstExample)
print("First result : \(firstResult)")

print(toBase64([0, 1]))

func fromBase64(_ data: String) -> [UInt8] {
    guard data.count > 0 else { return [] }

    let firstMask:UInt32 = UInt32(255)
    let secondMask:UInt32 = UInt32(255) << 8
    let thirdMask:UInt32 = UInt32(255) << 16

    let charactersTable = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    let splitted = data.split(separator: "")

    let lastValidIndex = data.count - 1

    var currentIndex = 0
    var goOn = true
    var currentBuffer: [String]
    var finalBuffer: [UInt8] = []
    var currentValuesBuffer: [UInt8]
    var totalString = ""
    let ct = charactersTable.split(separator: "")

    while goOn {

        currentBuffer = []

        let lastIndex = currentIndex + 3 <= lastValidIndex ? currentIndex + 3 : lastValidIndex
        for i in currentIndex...lastIndex {
            currentBuffer.append(String(splitted[i]))
        }


        if currentBuffer.count < 4 {
            goOn = false
        } else {
            currentIndex = lastIndex + 1
            if currentIndex >= lastValidIndex + 1 {
                goOn = false
            }
        }

        currentValuesBuffer = []
        for value in currentBuffer {
            let index = ct.firstIndex(where: { subs in
                return String(subs) == value
            }) ?? 0
            currentValuesBuffer.append(UInt8(index))
        }
        print(currentValuesBuffer)


        if currentValuesBuffer.count == 4 {
            let uintBuffer = (UInt32(currentValuesBuffer[0]) << 18) |
            (UInt32(currentValuesBuffer[1]) << 12) |
            (UInt32(currentValuesBuffer[2]) << 6) |
            (UInt32(currentValuesBuffer[3]) << 0)

            print(currentValuesBuffer[0])
            print(UInt32(currentValuesBuffer[0] << 18))

            print(uintBuffer)
            //0110100001101001
            //011101000110100001101001
            //011101000110100001101001
            //            111111
            //11111111
            let f = UInt8((uintBuffer & (UInt32(255) << 16)) >> 16)
            let s = UInt8((uintBuffer & (UInt32(255) << 8)) >> 8)
            let t = UInt8(uintBuffer & UInt32(255))

            print(f)

            finalBuffer.append(f)
            finalBuffer.append(s)
            finalBuffer.append(t)

        } else if currentValuesBuffer.count == 3 {
            let uintBuffer = (UInt32(currentValuesBuffer[0]) << 12) |
                             (UInt32(currentValuesBuffer[1]) << 6) |
                             (UInt32(currentValuesBuffer[2]))

            print(uintBuffer)

            let f = UInt8((uintBuffer & (UInt32(255) << 10)) >> 10)
            let s = UInt8((uintBuffer & (UInt32(255) << 2)) >> 2)

            finalBuffer.append(f)
            finalBuffer.append(s)

        } else if currentValuesBuffer.count == 2 {
            let uintBuffer = (UInt32(currentValuesBuffer[0]) << 6) | (UInt32(currentValuesBuffer[1]) << 0)
            let f = UInt8((uintBuffer & (UInt32(255) << 4)) >> 4)

            print(UInt32(currentValuesBuffer[0]) << 8)
            finalBuffer.append(f)

        }

        //       000000 000100 000100 000100
        //                111111 11
        //100001
        //011100
        //100110
        //011011

    }

    return finalBuffer
}

func toBase64(_ decoded: [UInt8]) -> String {
    guard decoded.count > 0 else {
        return ""
    }

    let firstMask:UInt32 = UInt32(63) << 26
    let secondMask:UInt32 = UInt32(63) << 20
    let thirdMask:UInt32 = UInt32(63) << 14
    let fourthMask:UInt32 = UInt32(63) << 8

    let charactersTable = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    let splittedCharacters = charactersTable.split(separator: "")

    var currentIndex = 0
    var goOn = true
    var currentBuffer: [UInt8]
    let lastValidIndex = decoded.count - 1
    var totalString = ""
    var initialLength = 0

    while goOn {

        currentBuffer = []
        let lastIndex = currentIndex + 2 <= lastValidIndex ? currentIndex + 2 : lastValidIndex
        for i in currentIndex...lastIndex {
            currentBuffer.append(decoded[i])
        }

        initialLength = currentBuffer.count
        if currentBuffer.count < 3 {
            goOn = false
            for i in 0..<3 - currentBuffer.count {
                currentBuffer.append(0)
            }
        } else {
            currentIndex = lastIndex + 1
            if currentIndex >= lastValidIndex + 1 {
                goOn = false
            }
        }

        let uintBuffer = (UInt32(currentBuffer[0]) << 24) |
        (UInt32(currentBuffer[1]) << 16) |
        (UInt32(currentBuffer[2]) << 8) |
        UInt32(0)

        var firstSymbol = Int((uintBuffer & firstMask) >> 26)
        var secondSymbol = Int((uintBuffer & secondMask) >> 20)
        var thirdSymbol = Int((uintBuffer & thirdMask) >> 14)
        var fourthSymbol = Int((uintBuffer & fourthMask) >> 8)

        if initialLength == 1 {
            totalString.append(String(splittedCharacters[firstSymbol]))
            totalString.append(String(splittedCharacters[secondSymbol]))
        }

        if initialLength == 2 {
            totalString.append(String(splittedCharacters[firstSymbol]))
            totalString.append(String(splittedCharacters[secondSymbol]))
            totalString.append(String(splittedCharacters[thirdSymbol]))
        }

        if initialLength == 3 {
            totalString.append(String(splittedCharacters[firstSymbol]))
            totalString.append(String(splittedCharacters[secondSymbol]))
            totalString.append(String(splittedCharacters[thirdSymbol]))
            totalString.append(String(splittedCharacters[fourthSymbol]))
        }

    }

    return totalString
}
