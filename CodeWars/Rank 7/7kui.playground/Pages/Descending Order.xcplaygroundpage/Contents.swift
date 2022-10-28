import Foundation

func descendingOrder(of number: Int) -> Int {
    let stringValue = String(number)
    let sorted = stringValue.sorted().reversed()

    return Int(String(sorted))!
}

print(descendingOrder(of: 42145))
print(descendingOrder(of: 123456789))
