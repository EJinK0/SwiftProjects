import UIKit

var greeting = "Hello, playground"

var board: [[Int]] = [[0,0,0,0,0],
                      [0,0,1,0,3],
                      [0,2,5,0,1],
                      [4,2,4,4,2],
                      [3,5,1,3,1]]

var moves: [Int] = [1,5,3,5,1,2,1,4]

solution(board, moves: moves)

func solution(_ board: [[Int]], moves: [Int]) -> Int {
    var boardTemp: [[Int]] = board
    var pocket: [Int] = [Int]()
    let row: Int = board.count
    //var column: Int = board.first?.count ?? 5
    var removedDoll: Int = 0
    
    for i in 0...moves.count-1 {
        let move: Int = moves[i]-1
        
        if boardTemp[row-1][move] == 0 {
            //print("all zero no doll")
            continue
        }
        
        for j in 0...row - 1 {
//            print("\(i) \(j) \(move) \(boardTemp[j][move])")
            let pick: Int = boardTemp[j][move]
            if pick == 0 {
                continue
            }
            else {
                pocket.append(boardTemp[j][move])
                boardTemp[j][move] = 0
                if pocket.count > 1 && pocket[pocket.count-2] == pocket[pocket.count-1] {
                    pocket.removeLast()
                    pocket.removeLast()
                    removedDoll += 2
                }
                break
            }
        }
    }
    return removedDoll
}
