import UIKit
import Foundation

let n: Int = 5
let lost: [Int] = [2,4]
let reserve: [Int] = [1,3,5]

let n2: Int = 5
let lost2: [Int] = [2,4]
let reserve2: [Int] = [3]

let n3: Int = 3
let lost3: [Int] = [3]
let reserve3: [Int] = [1]

let n4: Int = 10
let lost4: [Int] = [1, 2]
let reserve4: [Int] = [9]

let n5: Int = 5
let lost5: [Int] = [1, 2, 4]
let reserve5: [Int] = [2, 4, 5] // 정답 4

let n6:Int = 10
let lost6: [Int] = [5,1,6]
let reserve6: [Int] = [7,8,4] // 정답 4

solution(n6, lost6, reserve6)

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var save: Int = n - lost.count
    var realReserve: [Int] = reserve.filter{!lost.contains($0)}
    let onlyLost = lost.filter{!reserve.contains($0)}
    var saveCount = lost.count - onlyLost.count
    save += saveCount
    print(saveCount)
    
    for i in onlyLost {
        var index: Int = 0
        if i == 1 {
            if realReserve.contains(i+1) {
                index = realReserve.firstIndex(of: i+1)!
                realReserve.remove(at: index)
                save += 1
                continue
            }
        } else {
            if realReserve.contains(i-1) {
                index = realReserve.firstIndex(of: i-1)!
                realReserve.remove(at: index)
                save += 1
                continue
            }
            if realReserve.contains(i+1) {
                index = realReserve.firstIndex(of: i+1)!
                realReserve.remove(at: index)
                save += 1
                continue
            }
        }
    }
    
    print(save)
    return save
}
