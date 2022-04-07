import Foundation

var numbers: [Int] = [2,1,3,4,1]

solution(numbers)

func solution(_ numbers:[Int]) -> [Int] {
    var result: [Int:Int] = [Int:Int]()
    var add: Int = 0
    for i in 0..<numbers.count {
        for j in 0..<numbers.count {
            if i == j {
                continue
            } else {
                add = numbers[i] + numbers[j]
                result[add] = 0
            }
        }
    }
    
    result.sorted(by: <).map({$0.key})
    print(result.sorted(by: <).map({$0.key}))
    
    return []
}
