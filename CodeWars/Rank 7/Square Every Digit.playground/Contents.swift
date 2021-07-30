/*
 Welcome. In this kata, you are asked to square every digit of a number and concatenate them.

 For example, if we run 9119 through the function, 811181 will come out, because 92 is 81 and 12 is 1.

 Note: The function accepts an integer and returns an integer
 */

func squareDigits(_ num: Int) -> Int {
    var resultString = ""
    let parameter = String(num)
    
    parameter.forEach { current in
        let num = (Int(String(current)) ?? 0)
        resultString += String(num * num)
    }
    
    return Int(resultString) ?? 0
}

print(squareDigits(9119))
print(squareDigits(0))
print(squareDigits(123456))
