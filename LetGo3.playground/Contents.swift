import Foundation

var rc: [[Int]] = [[1,2,3], [4,5,6], [7,8,9]]
var rc2: [[Int]] = [[1,2,3,4], [5,6,7,8], [9,10,11,12]]
var operation: [String] = ["Rotate", "ShiftRow"]

solution(rc2, operation)

func solution(_ rc:[[Int]],_ operation: [String]) -> [[Int]] {
    let tempRC = shiftRow(rc)
    print(tempRC)
    return [[]]
}

func shiftRow(_ rc: [[Int]]) -> [[Int]] {
    var tempRC: [[Int]] = rc
    var tempLastRow:[Int] = []
    
    for (idx,r) in tempRC.reversed().enumerated() {
        print("idx : \(idx), r: \(r), tempCount-1: \(tempRC.count-1)")
        if idx == 0 {
            tempLastRow = r
            continue
        }
        
        if idx == tempRC.count - 1 {
            tempRC[tempRC.count - idx] = r
            tempRC[0] = tempLastRow
            break
        }
        
        tempRC[tempRC.count - idx] = r
    }
    return tempRC
}

func Rotate(_ rc: [[Int]]) -> [[Int]] {
    //.....이건...음
    return [[]]
}
