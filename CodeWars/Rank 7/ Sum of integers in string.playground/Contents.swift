/*
 Your task in this kata is to implement a function that calculates the sum of the integers inside a string. For example, in the string "The30quick20brown10f0x1203jumps914ov3r1349the102l4zy dog", the sum of the integers is 3635.
 */

func sumOfIntegersInString(_ string: String) -> Int {
    var numberString = ""
    var sum = 0
    
    string.forEach { current in
        if current.isNumber {
            numberString += String(current)
        } else {
            sum += Int(numberString) ?? 0
            numberString = ""
        }
    }
    sum += Int(numberString) ?? 0
    
    return sum
}


print(sumOfIntegersInString("12.4"))
print(sumOfIntegersInString("h3ll0w0rld"))
print(sumOfIntegersInString("The30quick20brown10f0x1203jumps914ov3r1349the102l4zy dog"))
