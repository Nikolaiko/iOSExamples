import Foundation

/*
 After a hard quarter in the office you decide to get some rest on a vacation. So you will book a flight for you and your girlfriend and try to leave all the mess behind you.

 You will need a rental car in order for you to get around in your vacation. The manager of the car rental makes you some good offers.

 Every day you rent the car costs $40. If you rent the car for 7 or more days, you get $50 off your total. Alternatively, if you rent the car for 3 or more days, you get $20 off your total.

 Write a code that gives out the total amount for different days(d).

 */

func RentalCarCost(_ days: Int) -> Int {
    var result = days * 40
    if days >= 7 {
        result -= 50
    } else if days >= 3 {
        result -= 20
    }
    return result
}

print(RentalCarCost(7))
print(RentalCarCost(10))
print(RentalCarCost(11))
print(RentalCarCost(34))
