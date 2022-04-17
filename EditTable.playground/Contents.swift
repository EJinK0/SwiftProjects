import UIKit
import Foundation

var n: Int = 8
var k: Int = 2
var cmd: [String] = ["D 2","C","U 3","C","D 4","C","U 2","Z","Z"]
var cmd2: [String] = ["D 2","C","U 3","C","D 4","C","U 2","Z","Z","U 1","C"]

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
    
    print(selectedIdx)
    
    for command in cmd {
        var split = command.split(separator: " ")
        var tempX: Int = 0
        if split[0] == "U" {
            tempX = Int(split[1]) ?? 0
            selectedIdx -= tempX
            print("moved idx is \(selectedIdx)")
        } else if split[0] == "D" {
            tempX = Int(split[1]) ?? 0
            selectedIdx += tempX
            print("moved idx is \(selectedIdx)")
        } else if split[0] == "C" {
            indexing.remove(at: selectedIdx)
            deletedIdx.append(selectedIdx)
            print("deleted idx is \(selectedIdx)")
            if selectedIdx == indexing.count {
                selectedIdx -= 1
                print("idx is \(selectedIdx)")
            }
        } else if split[0] == "Z" {
            print("deleted list \(deletedIdx)")
            var deletedListLastItem = deletedIdx.removeLast()
            indexing.insert(deletedListLastItem, at: deletedListLastItem)
            print("recover item index is \(deletedListLastItem)")
        }
        
        print("cmd \(command)/ selected idx:\(selectedIdx)/ indexlist\(indexing)")
        print("--------")
    }
    
    for item in deletedIdx {
        origin[item] = "X"
    }
    print(origin)
    return ""
}
