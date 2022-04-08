import Foundation

var d: [Int] = [1,3,2,5,4]
var budget: Int = 9

var d2: [Int] = [2,2,3,3]
var budget2: Int = 10

var d3: [Int] = [5,5]
var budget3: Int = 9


solution(d3, budget3)

func solution(_ d:[Int], _ budget:Int) -> Int {
    var result: [[Int]] = [[Int]]()
    var max: Int = 0
    var isMax: Bool = false
    
    for i in stride(from:d.count, to:0, by: -1) {
        getCombination(d, i, &result)
        print("\(i) \(result)")
        for j in 0..<result.count {
            let sum: Int = result[j].reduce(0, {(result: Int, next: Int) -> Int in
                return result + next
            })
            if sum <= budget {
                max = i
                isMax = true
            }
            
        }
        result.removeAll()
        
        if isMax == true {
            break
        }
    }
    
    print(max)
    return max
}

func getCombination<T>(_ arr: [T], _ combiNum: Int, _ result: inout [[T]], _ now: [T] = [T]()) {
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
