import UIKit
import Foundation

var a: [Int] = [1,2,3,4]
var b: [Int] = [-3,-1,0,2]
var a2: [Int] = [-1,0,1]
var b2: [Int] = [1,0,-1]

solution(a2,b2)

func solution(_ a:[Int], _ b:[Int]) -> Int {
    var result: Int = 0
    
    for i in 0...a.count-1 {
        result += (a[i] * b[i])
    }
    return result
}
