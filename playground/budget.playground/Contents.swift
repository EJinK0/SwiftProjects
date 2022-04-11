import Foundation

var d: [Int] = [1,3,2,5,4]
var budget: Int = 9

var d2: [Int] = [2,2,3,3]
var budget2: Int = 10

var d3: [Int] = [5,5]
var budget3: Int = 9


solution(d, budget)

func solution(_ d:[Int], _ budget:Int) -> Int {
    var money = budget
    
    let result = d.sorted().filter {
        if (money - $0) >= 0 {
            money = money - $0
            return true
        } else {
            return false
        }
    }.count
    
    print(result)
    return result
}
