import UIKit
import Foundation

let answers: [Int] = [1,2,3,4,5]
let answers2: [Int] = [1,3,2,4,2]
let answers3: [Int] = [1,3,2,4,2,3,2,3,3,2,3,1,3,2,4,5,4,3,2,4,3,2,4,3,1,3,4,2,2,3]

solution(answers3)

func solution(_ answers:[Int]) -> [Int] {
    let first: [Int] = [1,2,3,4,5]
    let second: [Int] = [2,1,2,3,2,4,2,5]
    let third: [Int] = [3,3,1,1,2,2,4,4,5,5]
    var firstIndex: Int = 0
    var secondIndex: Int = 0
    var thirdIndex: Int = 0
    var result: [Int] = [Int](repeating: 0, count: 3)
    
    for i in answers {
        if first[firstIndex] == i {
            result[0] += 1
        }
        if second[secondIndex] == i {
            result[1] += 1
        }
        if third[thirdIndex] == i {
            result[2] += 1
        }
        
        firstIndex += 1
        secondIndex += 1
        thirdIndex += 1
        
        if firstIndex == (first.count) {
            firstIndex = 0
        }
        if secondIndex == (second.count) {
            secondIndex = 0
        }
        if thirdIndex == (third.count) {
            thirdIndex = 0
        }
    }
    
    print(result)
    
    var maxValue: Int = 0
    for k in result {
        if k > maxValue {
            maxValue = k
        }
    }

    var winer: [Int] = [Int]()
    
    for (index, j) in result.enumerated() {
        if j == maxValue {
            winer.append(index + 1)
        }
    }
    
    print(winer)
    return winer
}
