import UIKit
import Foundation

var places: [[String]] = [["POOOP", "OXXOX", "OPXPX", "OOXOX", "POXXP"],
                          ["POOPX", "OXPXP", "PXXXO", "OXXXO", "OOOPP"],
                          ["PXOPX", "OXOXP", "OXPOX", "OXXOP", "PXPOX"],
                          ["OOOXX", "XOOOX", "OOOXX", "OXOOX", "OOOOO"],
                          ["PXPXP", "XPXPX", "PXPXP", "XPXPX", "PXPXP"]];

solution(places)

func solution(_ places:[[String]]) -> [Int] {
    var person: [(Int, Int)] = [(Int, Int)]()
    var manhattanTwoUnder: [(Int, Int)] = [(Int, Int)]()
    
    for (i,room) in places.enumerated() {
        //print("\(i) \(room)")
        for (j,seat) in room.enumerated() {
            //print("\(j) \(seat)")
            for (k, p) in seat.enumerated() {
                //print("\(k) \(p)")
                if p == "P" {
                    person.append((j,k))
                }
            }
        }
        
        print("person: \(person)")
        print("-------------------")
        
        
        for (i,(x,y)) in person.enumerated() {
            for j in i+1..<person.count {
                var tupel: (Int, Int) = person[j]
                if abs((x - tupel.0) + (y - tupel.1)) <= 2 {
                    manhattanTwoUnder.append((x,y))
                    manhattanTwoUnder.append(tupel)
                }
            }
        }

        print("manhattanTwoUnder \(manhattanTwoUnder))")
        //print("manhattanTwoUnder \(manhattanTwoUnder))")
        person.removeAll()
        manhattanTwoUnder.removeAll()
        //print(result)
        //print(manhattanTwoUnder)
    }
    
    
    return []
}
