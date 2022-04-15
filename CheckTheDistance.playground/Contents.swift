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
    var result: [Int] = [Int]()
    var isKeepDistance: Bool = true
    
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
        
        if person.count == 0 {
            result.append(1)
            continue
        }
        
        for (i,(x,y)) in person.enumerated() {
            for j in i+1..<person.count {
                var tupel: (Int, Int) = person[j]
                if abs(x - tupel.0) + abs(y - tupel.1) <= 2 {
                    manhattanTwoUnder.append((x,y))
                    manhattanTwoUnder.append(tupel)
                }
            }
        }

        print("manhattanTwoUnder \(manhattanTwoUnder))")
        
        
        var count = 0;
        for (i,(x,y)) in manhattanTwoUnder.enumerated() {
            if count == 1 {
                count = 0
                continue
            }
            var next: (Int,Int) = manhattanTwoUnder[i+1]
            if (places[x][next.1] != "X" && places[x][next.1] != "P")
                || (places[next.0][y] != "X" && places[next.0][y] != "P") {
                result.append(0)
                isKeepDistance = false
            }

            if !isKeepDistance {
                break
            }

            count += 1
        }

        if isKeepDistance{
            result.append(1)
        }
        
        person.removeAll()
        manhattanTwoUnder.removeAll()
        
        print("---------------")
    }
    
    print(result)
    return []
}
