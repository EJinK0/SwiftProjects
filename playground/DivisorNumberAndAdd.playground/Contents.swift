import UIKit
import Foundation

var left: Int = 13
var right: Int = 17
var left2: Int = 24
var right2: Int = 27

solution(left2, right2)

func solution(_ left:Int, _ right:Int) -> Int {
    var findDivisor: [Int] = [Int]()
    var result: Int = 0
    for i in left...right {
        var count: Int = 0
        for j in 1...i {
            if i % j == 0 {
                count += 1
            }
        }
        if count % 2 == 0 {
            result += i
        } else {
            result -= i
        }
        
        count = 0
    }
    print(result)
    return result
}
