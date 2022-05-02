import Foundation

var numbers1: [Int] = [1, 3, 4, 5, 8, 2, 1, 4, 5, 9, 5]
var numbers2: [Int] = [7, 0, 8, 2, 8, 3, 1, 5, 7, 6, 2]
var numbers3: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]
var leftHand: String = "left"
var rightHand: String = "right"

solution(numbers3, rightHand)

func solution(_ numbers:[Int], _ hand:String) -> String {
    var result: String = ""
    let keypadDic: [Int:(Int,Int)] = [1:(0,0), 2:(0,1), 3:(0,2),
                                      4:(1,0), 5:(1,1), 6:(1,2),
                                      7:(2,0), 8:(2,1), 9:(2,2),
                                      -1:(3,0), 0:(3,1), -2:(3,2)]
    var leftNum: Int = -1
    var rightNum: Int = -2
    
    for num in numbers {
        if num == 1 {
            result.append("L")
            leftNum = 1
        } else if num == 4 {
            result.append("L")
            leftNum = 4
        } else if num == 7 {
            result.append("L")
            leftNum = 7
        } else if num == 3 {
            result.append("R")
            rightNum = 3
        } else if num == 6 {
            result.append("R")
            rightNum = 6
        } else if num == 9 {
            result.append("R")
            rightNum = 9
        } else {
            let leftCoordinate: (Int, Int) = keypadDic[leftNum]!
            let rightCoordinate: (Int, Int) = keypadDic[rightNum]!
            let toPressNumCoordinate: (Int, Int) = keypadDic[num]!
            
            let distanceFromLeftHand = abs(leftCoordinate.0 - toPressNumCoordinate.0) + abs(leftCoordinate.1 - toPressNumCoordinate.1)
            let distanceFromRightHand = abs(rightCoordinate.0 - toPressNumCoordinate.0) + abs(rightCoordinate.1 - toPressNumCoordinate.1)
            
            if distanceFromLeftHand == distanceFromRightHand {
                if hand == "right" {
                    result.append("R")
                    rightNum = num
                } else {
                    result.append("L")
                    leftNum = num
                }
            } else if distanceFromLeftHand > distanceFromRightHand {
                result.append("R")
                rightNum = num
            } else if distanceFromLeftHand < distanceFromRightHand {
                result.append("L")
                leftNum = num
            }
        }
    }
    print(result)
    
    return result
}
