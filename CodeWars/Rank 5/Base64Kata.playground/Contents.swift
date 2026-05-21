import Foundation

func fromBase64(_ data: String) -> [UInt8] {
    guard data.count > 0 else { return [] }

    let firstMask:UInt32 = UInt32(255)
    let secondMask:UInt32 = UInt32(255) << 8
    let thirdMask:UInt32 = UInt32(255) << 16

    let charactersTable = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    let splitted = data.reversed().split(separator: "")

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
            print(String(splitted[i]))
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


        //goOn = false

        currentValuesBuffer = []
        for value in currentBuffer {
            let index = ct.firstIndex(where: { subs in
                return String(subs) == value
            }) ?? 0
            currentValuesBuffer.append(UInt8(index))
        }

        print(currentValuesBuffer)

        if currentValuesBuffer.count == 4 {
            let uintBuffer = (UInt32(currentValuesBuffer[0])) | (UInt32(currentValuesBuffer[1]) << 6) |
            (UInt32(currentValuesBuffer[2]) << 12) |
            (UInt32(currentValuesBuffer[3]) << 18)

            let f = UInt8(uintBuffer & firstMask)
            let s = UInt8((uintBuffer & secondMask) >> 8)
            let t = UInt8((uintBuffer & thirdMask) >> 16)

            finalBuffer.append(f)
            finalBuffer.append(s)
            finalBuffer.append(t)



        } else if currentValuesBuffer.count == 3 {
            let uintBuffer = (UInt32(currentValuesBuffer[0])) | (UInt32(currentValuesBuffer[1]) << 6) |
            (UInt32(currentValuesBuffer[2]) << 12) |
            (UInt32(0) << 18)

            print(uintBuffer)
            let f = UInt8(uintBuffer & firstMask)
            let s = UInt8((uintBuffer & secondMask) >> 8)
            let t = UInt8((uintBuffer & thirdMask) >> 16)

            finalBuffer.append(f)
            finalBuffer.append(s)
            finalBuffer.append(t)

            print(finalBuffer)

        } else if currentValuesBuffer.count == 2 {
            let uintBuffer = (UInt32(currentValuesBuffer[0])) | (UInt32(currentValuesBuffer[1]) << 6) |
            (UInt32(0) << 12) |
            (UInt32(0) << 18)

            let f = UInt8(uintBuffer & firstMask)
            let s = UInt8((uintBuffer & secondMask) >> 8)


            finalBuffer.append(f)
            finalBuffer.append(s)
        }



        //100001
        //011100
        //100110
        //011011

        //        print(uintBuffer)
        //        print(firstMask)
        //        print(secondMask)
        //        print(thirdMask)

//        var firstSymbol = Int((uintBuffer & firstMask) >> 26)
//        var secondSymbol = Int((uintBuffer & secondMask) >> 20)
//        var thirdSymbol = Int((uintBuffer & thirdMask) >> 14)
//        var fourthSymbol = Int((uintBuffer & fourthMask) >> 8)

        //        print(firstSymbol)
        //        print(secondSymbol)
        //        print(thirdSymbol)


//        totalString.append(String(ct[firstSymbol]))
//        totalString.append(String(ct[secondSymbol]))
//        totalString.append(String(ct[thirdSymbol]))
//        totalString.append(String(ct[fourthSymbol]))

    }


    //dGhpcyBpcyBhIGJ5dGVzdHJpbmch
    //dGhpcyBpcyBhIGJ5dGVzdHJpbmch


    //bm93IGlzIHRoZSB0aW1lIGZvciBhbGwgZ29vZCBtZW4gdG8gY29tZSB0byB0aGUgYWlkIG9mIHRoZWlyIGNvdW50cnku
    //bm93IGlzIHRoZSB0aW1lIGZvciBhbGwgZ29vZCBtZW4gdG8gY29tZSB0byB0aGUgYWlkIG9mIHRoZWlyIGNvdW50cnku

    //print("Test : \(String(describing: String(data: Data(finalBuffer.reversed()), encoding: .utf8)))")

    return finalBuffer.reversed()
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


    let ct = charactersTable.split(separator: "")


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

        //        print(uintBuffer)
        //        print(firstMask)
        //        print(secondMask)
        //        print(thirdMask)

        var firstSymbol = Int((uintBuffer & firstMask) >> 26)
        var secondSymbol = Int((uintBuffer & secondMask) >> 20)
        var thirdSymbol = Int((uintBuffer & thirdMask) >> 14)
        var fourthSymbol = Int((uintBuffer & fourthMask) >> 8)

        //        print(firstSymbol)
        //        print(secondSymbol)
        //        print(thirdSymbol)

        if initialLength == 1 {
            totalString.append(String(ct[firstSymbol]))
            totalString.append(String(ct[secondSymbol]))
        }

        if initialLength == 2 {
            totalString.append(String(ct[firstSymbol]))
            totalString.append(String(ct[secondSymbol]))
            totalString.append(String(ct[thirdSymbol]))
        }

        if initialLength == 3 {


            totalString.append(String(ct[firstSymbol]))
            totalString.append(String(ct[secondSymbol]))
            totalString.append(String(ct[thirdSymbol]))
            totalString.append(String(ct[fourthSymbol]))


        }

    }




    return totalString
}

let test1 = "dGhpcyBpcyBhIGJ5dGVzdHJpbmch"
let test2 = "ZEdocGN5QnBjeUJoSUdKNWRHVnpkSEpwYm1jaAAA"
let test3 = "AAE"

let encode1: [UInt8] = [116, 104, 105, 115, 32, 105, 115, 32, 97, 32, 98, 121, 116, 101, 115, 116, 114, 105, 110, 103, 33]
print(toBase64(encode1))
print(toBase64([0]))

let fromBase64_1 = fromBase64(test3)
print("fromBase64: \(fromBase64_1)")

//let fromBase64String_1 = String(data: Data(fromBase64_1), encoding: .utf8)
//print("fromBase64 string: \(String(describing: fromBase64String_1))")

//print("Correct : \(String(describing: String(data: Data(encode1), encoding: .utf8)))")
