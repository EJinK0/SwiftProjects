import UIKit
import Foundation

var array: [Int] = [1, 5, 2, 6, 3, 7, 4]
var commands: [[Int]] = [[2, 5, 3], [4, 4, 1], [1, 7, 3]]

solution(array, commands)

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var tempArray: [Int] = [Int]()
    var resultArray: [Int] = [Int]()
    for cmd in commands {
        
        for i in cmd[0]-1...cmd[1]-1 {
            //print("\(i)")
            tempArray.append(array[i])
        }
        
        tempArray = tempArray.sorted(by: <)
        resultArray.append(tempArray[cmd[2]-1])
        print(tempArray)
        tempArray.removeAll()
    }
    print(resultArray)
    return resultArray
}
