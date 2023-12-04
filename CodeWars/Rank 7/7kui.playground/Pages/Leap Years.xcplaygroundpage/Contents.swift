import Foundation

func isLeapYear(_ year: Int) -> Bool {
    guard year % 4 == 0 else { return false }
    if year % 100 == 0 {
        return year % 400 == 0
    } else {
        return true
    }
}

print(isLeapYear(1900))
print(isLeapYear(40))
