import UIKit
import Foundation

var n: Int = 5
var stages: [Int] = [2, 1, 2, 6, 2, 4, 3, 3]
var n2: Int = 4
var stages2: [Int] = [4,4,4,4,4]

print(solution(n, stages))

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var failureRate: [Int: Double] = [Int: Double]()
    var rates = Array(repeating: 0, count: N + 1)
    let result: [Int] = [Int]()
    
    for i in stages {
        for j in 0..<i {
            rates[j] += 1
        }
    }
    
    for i in 0..<N {
        failureRate.updateValue((Double(rates[i] - rates[i+1]) / Double(rates[i])) , forKey: i+1)
    }
    
    let decending = failureRate.sorted(by: <).sorted(by: {$0.value > $1.value}).map({ $0.key })
    
    return result
}
