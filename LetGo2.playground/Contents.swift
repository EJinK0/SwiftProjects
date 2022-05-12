import Foundation

var queue1: [Int] = [3, 2, 7, 2]
var queue2: [Int] = [4, 6, 5, 1]

var queue3: [Int] = [1,2,1,2]
var queue4: [Int] = [1,10,1,2]

var queue5: [Int] = [1,1]
var queue6: [Int] = [1,5]

var queue7: [Int] = [7,1,1]
var queue8: [Int] = [1,1,1]

var resultList = [String]()

solution(queue1, queue2)

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    var tempQ1 = queue1
    var tempQ2 = queue2
    var moveCount: Int = 0
    
    var firstCountSumQ1 = 0
    var firstCountSumQ2 = 0
    
    let count = (tempQ1+tempQ2).reduce(0){$0 + $1}/2
    
    var q1Sum = tempQ1.reduce(0){$0 + $1}
    var q2Sum = tempQ2.reduce(0){$0 + $1}
    
    while q1Sum != q2Sum {
        if q1Sum > q2Sum {
            PushPop(&tempQ1, &tempQ2)
            moveCount += 1
        } else {
            PushPop(&tempQ2, &tempQ1)
            moveCount += 1
        }
        
        q1Sum = tempQ1.reduce(0){$0 + $1}
        q2Sum = tempQ2.reduce(0){$0 + $1}
        
        print("\(q1Sum) \(q2Sum)")
        if moveCount == 1 {
            firstCountSumQ1 = q1Sum
            firstCountSumQ2 = q2Sum
        }
        
        if q1Sum == firstCountSumQ1 && q2Sum == firstCountSumQ2 {
            if moveCount == 1 { continue }
            moveCount = -1
            break
        }
    }
    
    print(moveCount)
    return moveCount
}

func PushPop(_ q1: inout [Int], _ q2: inout [Int]) {
    q2.append(q1.removeFirst())
}
