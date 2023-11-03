/*
 Sometimes, I want to quickly be able to convert miles per imperial gallon (mpg) into kilometers per liter (kpl).

 Create an application that will display the number of kilometers per liter (output) based on the number of miles per imperial gallon (input).

 Your answer should be accurate within 0.01 kpl.

 Some useful associations relevant to this kata:

 1 Imperial Gallon = 4.54609188 litres
 1 Mile = 1.609344 kilometres
 */


import Foundation

func converter(mpg: Int) -> Double {
    let galoon = 4.54609188
    let kilometer = 1.609344
    let divisor = pow(10.0, 2.0)
    
    let kilometers = Double(mpg) * kilometer / galoon
    
    return (kilometers * divisor).rounded() / divisor
}

print(converter(mpg: 12))
