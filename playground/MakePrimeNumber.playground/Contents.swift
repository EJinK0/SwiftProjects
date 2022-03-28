import UIKit
import Foundation

var nums: [Int] = [1,2,3,4]
var nums2: [Int] = [1,2,7,6,4]
var numOfCases: [[Int]] = [[Int]]()
var temp: [Int] = [Int]()

solution(nums2)

func solution(_ nums:[Int]) -> Int {
    var result: Int = 0
    
    getCombination(nums, 3, &numOfCases)
    for i in numOfCases {
        let sum: Int = i.reduce(0) { return $0 + $1 }
        if isPrime(num: sum) {
            result += 1
        }
    }
    print(result)
    return result
}

//조합
func getCombination(_ arr: [Int], _ combiNum: Int, _ result: inout [[Int]], _ now: [Int] = [Int]()) {
    let arrayCount = arr.count
    guard arrayCount > 0 else { return }
    
    if combiNum == 0 {
        result.append(now)
    } else if arrayCount == combiNum {
        result.append(now + arr)
    } else {
        getCombination(Array(arr[1...]), combiNum - 1, &result, now + [arr.first!])
        getCombination(Array(arr[1...]), combiNum, &result, now)
    }
}

//소수구하기
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
