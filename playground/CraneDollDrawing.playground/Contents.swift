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
    var row: Int = board.count
    var removedDoll: Int = 0
    
    for i in 0...moves.count-1 {
        let move: Int = moves[i]-1
        
        if boardTemp[row-1][move] == 0 {
            continue
        }
        
        for j in 0...row - 1 {
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
    print(removedDoll)
    return removedDoll
}
