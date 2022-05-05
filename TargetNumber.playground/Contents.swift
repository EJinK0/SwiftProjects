import Foundation

var numbers = [1,1,1,1,1]
var target = 3

var number: [Int] = []
var targets: Int = 0
var count: Int = 0

solution(numbers, target)

func solution(_ numbers:[Int], _ target:Int) -> Int {
    number = numbers
    targets = target
    
    dfs(index: 0, sum: 0)

    return count
}

func dfs(index: Int, sum: Int) {
    if index == number.count {
        if sum == targets {
            count += 1
        }
        return
    }
    dfs(index: index + 1, sum: sum + number[index])
    dfs(index: index + 1, sum: sum - number[index])
}

