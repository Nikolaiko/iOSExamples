/*
 A prime number (or a prime) is a natural number greater than 1 that has no positive divisors other than 1 and itself.

 A more detailed description of prime numbers can be found at: http://en.wikipedia.org/wiki/Prime_number

 The Problem
 You will need to create logic for the following two functions: isPrime(number) and getPrimes(start, finish)

 isPrime(number)
 Should return boolean true if prime, otherwise false

 getPrimes(start, finish)
 Should return a unique, sorted array of all primes in the range [start, finish] (i.e. both numbers inclusive). Note that this range can go both ways - e.g. getPrimes(10, 1) should return all primes from 1 to 10 both inclusive.
 */

import Foundation

extension Int {
    func isPrime() -> Bool {
        guard self > 1 else { return false }
        let checkRange = 2..<self
        for currentNumber in checkRange {
            if self % currentNumber == 0 { return false }
        }
        return true
    }
}

func getPrimes(from start: Int, to end: Int) -> [Int] {
    let bounds: (Int, Int) = start <= end ? (start, end) : (end, start)
    let checkRange = bounds.0...bounds.1
    var primes: [Int] = []
    for currentNumber in checkRange {
        if currentNumber.isPrime() { primes.append(currentNumber) }
    }
    return primes
}

print(1.isPrime())
print(2.isPrime())
print(3.isPrime())
print(4.isPrime())
print(5.isPrime())

print(getPrimes(from: 0, to: 0))
print(getPrimes(from: 0, to: 30))
print(getPrimes(from: 30, to: 0))
