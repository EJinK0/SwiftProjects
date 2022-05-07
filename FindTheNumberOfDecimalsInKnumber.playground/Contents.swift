import Foundation

var n: Int = 437674
var k: Int = 3

var n2: Int = 110011
var k2: Int = 10

solution(n2, k2)

func solution(_ n:Int, _ k:Int) -> Int {
    let getNumbers: [String] = String(n, radix: k).components(separatedBy: "0")
    var correctPrimeCount: Int = 0
    
    print(getNumbers)
    
    for g in getNumbers {
        if g.isEmpty { continue }
        if isPrime(num: Int(g)!) {
            correctPrimeCount += 1
        }
    }
    
    print(correctPrimeCount)
    return correctPrimeCount
}

func isPrime(num: Int) -> Bool {
    if num < 4 {
        return num == 1 ? false : true
    }
    for i in 2...Int(sqrt(Double(num))) {
        if num % i == 0 {
            return false
        }
    }
    return true
}
