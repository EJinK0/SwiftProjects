import UIKit

var lottos: [Int] = [44,1,0,0,31,25]
var win_nums: [Int] = [31,10,45,1,6,19]

var lottos2: [Int] = [0,0,0,0,0,0]
var win_nums2: [Int] = [38,19,20,40,15,25]

var lottos3: [Int] = [45,4,35,20,3,9]
var win_nums3: [Int] = [20,9,3,45,4,35]

solution(lottos3, win_nums3)

func solution(_ lottos: [Int], _ win_nums: [Int]) -> [Int] {
    var correctCount: Int = 0
    var unknownNumCount: Int = 0
    
    for myNum in lottos {
        if win_nums.contains(myNum) {
            correctCount += 1
        } else if myNum == 0 {
            unknownNumCount += 1
        }
    }
    
    var result: [Int] = [Int]()
    result.append(showMeResult(correctCount + unknownNumCount))
    result.append(showMeResult(correctCount))

    return result
}

func showMeResult(_ num: Int) -> Int {
    switch num {
    case 6:
        return 1
    case 5:
        return 2
    case 4:
        return 3
    case 3:
        return 4
    case 2:
        return 5
    default:
        return 6
    }
}
