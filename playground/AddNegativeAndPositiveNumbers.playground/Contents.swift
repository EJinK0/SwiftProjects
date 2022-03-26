import UIKit
import Foundation

var absolutes: [Int] = [4,7,12]
var signs: [Bool] = [true,false,true]

var absolutes2: [Int] = [1,2,3]
var signs2: [Bool] = [false,false,true]

solution(absolutes2, signs2)

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    var result: Int = 0
    for i in 0...absolutes.count-1{
        if signs[i] == true {
            result += absolutes[i]
        } else {
            result += (-absolutes[i])
        }
    }
    return result
}
