import UIKit
import Foundation

var n: Int = 5
var stages: [Int] = [2, 1, 2, 6, 2, 4, 3, 3]
var n2: Int = 4
var stages2: [Int] = [4,4,4,4,4]


solution(n, stages)

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var failureRate: [Double] = [Double](repeating: 0.0, count: N)
    var peopleInStages: [Int] = [Int](repeating: 0, count: N+1)
    var gamers: Int = stages.count
    var result: [Int] = [Int]()
    
    for i in stages {
        peopleInStages[i-1] += 1
    }
    
    print(peopleInStages)
    
    for (index, j) in peopleInStages.enumerated() {
        if index == N-1 {
            if peopleInStages[index + 1] > 0 {
                failureRate[index] = (Double(j)/(Double(gamers) + Double(peopleInStages[index + 1])))
            } else {
                failureRate[index] = (Double(j)/Double(gamers))
                gamers -= j
            }
            break;
        } else {
            failureRate[index] = (Double(j)/Double(gamers))
            gamers -= j

        }
    }
    
    print("-----------------")
    print(failureRate)
    let decending: [Double] = selectionSort_Descending(failureRate)

    print(decending)
    print("-----------------")
    for i in decending {
        let element: Int = failureRate.firstIndex(where: {$0.isEqual(to: i)}) ?? -1
        if element != -1 {
            failureRate[element] = -1
            result.append(element + 1)
        }
    }
    
    print(result)
    return result
}


func selectionSort(_ array: [Double]) -> [Double] {
  guard array.count > 1 else { return array }

  var a = array

  for x in 0 ..< a.count - 1 {
    var lowest = x
    for y in x + 1 ..< a.count {
      if a[y] < a[lowest] {
        lowest = y
      }
    }

    if x != lowest {
      a.swapAt(x, lowest)
    }
  }
  return a
}

func selectionSort_Descending(_ array: [Double]) -> [Double] {
  guard array.count > 1 else { return array }

  var a = array

  for x in 0 ..< a.count - 1 {
    var highest = x
    for y in x + 1 ..< a.count {
      if a[y] > a[highest] {
        highest = y
      }
    }

    if x != highest {
      a.swapAt(x, highest)
    }
  }
  return a
}

