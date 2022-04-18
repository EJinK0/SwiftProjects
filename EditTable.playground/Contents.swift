import UIKit
import Foundation

var n: Int = 8
var n2: Int = 5
var k: Int = 2
var k2: Int = 1
var cmd: [String] = ["D 2","C","U 3","C","D 4","C","U 2","Z","Z"]
var cmd2: [String] = ["D 2","C","U 3","C","D 4","C","U 2","Z","Z","U 1","C"]
var cmd3: [String] = ["C", "C", "C"]

solution(n, k, cmd2)

func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    var selectedIdx = k
    var indexing: [Int] = [Int]()
    var origin: [String] = [String]()
    var deletedIdx: [Int] = [Int]()
    
    for i in 0..<n {
        indexing.append(i)
        origin.append("O")
    }
    
    print(indexing)
    
    for command in cmd {
        print(command)
        var split = command.split(separator: " ")
        if split[0] == "U" {
            let num = Int(split[1])
            var count = 1
            var isNegative: Bool = false
            while !isNegative {
                selectedIdx -= 1
                if num == 1 {
                    if indexing[selectedIdx] == -1 {
                        continue
                    } else {
                        isNegative = true
                        continue
                    }
                } else {
                    if count == num {
                        isNegative = true
                        continue
                    }
                    
                    if indexing[selectedIdx] == -1 {
                        continue
                    } else {
                        count += 1
                        continue
                    }
                }
            }
        } else if split[0] == "D" {
            let num = Int(split[1])
            var count = 1
            var isNegative: Bool = false
            while !isNegative {
                selectedIdx += 1
                if num == 1 {
                    if indexing[selectedIdx] == -1 {
                        continue
                    } else {
                        isNegative = true
                        continue
                    }
                } else {
                    if count == num {
                        isNegative = true
                        continue
                    }
                    
                    if indexing[selectedIdx] == -1 {
                        continue
                    } else {
                        count += 1
                        continue
                    }
                }
            }
        } else if split[0] == "C" {
            indexing[selectedIdx] = -1
            deletedIdx.append(selectedIdx)
            if selectedIdx == indexing.count - 1 {
                selectedIdx -= 1
                print(selectedIdx)
                continue
            }
            selectedIdx += 1
        } else if split[0] == "Z" {
            var lastItem = deletedIdx.removeLast()
            indexing[lastItem] = lastItem
            //print(selectedIdx)
        }
        
        print(selectedIdx)
    }
    
    var result: String = ""
    for item in indexing {
        if item == -1 {
            result += "X"
        } else {
            result += "O"
        }
    }
    print(indexing)
    print(result)
    return result
}
