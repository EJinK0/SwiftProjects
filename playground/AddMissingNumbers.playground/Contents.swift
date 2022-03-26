import UIKit
import Foundation

var numbers: [Int] = [1,2,3,4,6,7,8,0]
var nubmers2: [Int] = [5,8,4,0,6,7,9]

solution(numbers)

func solution(_ numbers:[Int]) -> Int {
    let sortedNumbers: [Int] = numbers.sorted(by: <)
    var zeroToNineArray: [Int] = [Int](repeating: 0, count: 10)
    var result: Int = 0
    for i in sortedNumbers {
        if i == 0 {
            zeroToNineArray[i] = -1
            continue
        }
        zeroToNineArray[i] = i
    }
    
    for i in 0...9 {
        if zeroToNineArray[i] == 0 {
            result += i
        }
    }
    return result
}
