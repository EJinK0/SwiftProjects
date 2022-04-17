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
    var result: [Int] = [Int](repeatElement(0, count: 5))
    var isKeepDistance: Bool = true
    var isManhattanDistanceOne = false
    
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
        
        if person.count == 0 {
            print("this room is no person")
            print("-----------------------")
            result[i] = 1
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
        
        print("manhattanTwoUnder roomnum is \(manhattanTwoUnder)")
        
        var tempManhattanTwoUnder: [(Int, Int)] = [(Int, Int)]()
        
        var count = 0;
        for (j,(x,y)) in manhattanTwoUnder.enumerated() {
            if j+1 == manhattanTwoUnder.count {
                continue
            }
            
            if j % 2 != 0 {
                continue
            }
            
            let next: (Int,Int) = manhattanTwoUnder[j+1]
            
            if abs(x - next.0) + abs(y - next.1) == 1 {
                isManhattanDistanceOne = true
                break
            }
            
            if x == next.0 {
                var temp: String = room[x]
                var tempItem: String = ""

                for (i,char) in temp.enumerated() {
                    if next.1 - 1 == i {
                        tempItem = String(char)
                    }
                }
                
                if tempItem != "X" {
                    isKeepDistance = false
                    break
                }
            } else if(y == next.1) {
                var temp2: String = room[next.0-1]
                var tempItem2: String = ""
                for (j,char) in temp2.enumerated() {
                    if j == y {
                        tempItem2 = String(char)
                    }
                }
                if tempItem2 != "X" {
                    isKeepDistance = false
                    break
                }
            } else {
                var temp3: String = room[x]
                var temp4: String = room[next.0]
                var tempItem3: String = ""
                var tempItem4: String = ""
                
                for (i,char) in temp3.enumerated() {
                    if i == next.1 {
                        tempItem3 = String(char)
                    }
                }
                
                for(j,char) in temp4.enumerated() {
                    if j == y {
                        tempItem4 = String(char)
                    }
                }
                
                if tempItem3 != "X" || tempItem4 != "X" {
                    isKeepDistance = false
                    break
                }
            }
        }

        print("isManhattanDistanceOne \(isManhattanDistanceOne), isKeepDistance \(isKeepDistance)")
        if isManhattanDistanceOne || !isKeepDistance {
            result[i] = 0
            isManhattanDistanceOne = false
            isKeepDistance = true
            print("this room is manhattan distance one of false")
            print("---------------")
            person.removeAll()
            manhattanTwoUnder.removeAll()
            continue
        }
    
        result[i] = 1
        print("this room is keep distance true!!")
        
        person.removeAll()
        manhattanTwoUnder.removeAll()
        
        print("---------------")
    }
    
    print(result)
    return result
}
