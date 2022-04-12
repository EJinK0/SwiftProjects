import UIKit
import Foundation
import Darwin

var a: String = "aabbaccc"
var b: String = "ababcdcdababcdcd"
var c: String = "abcabcdede"
var d: String = "abcabcabcabcdededededede"
var e: String = "xababcdcdababcdcd"

solution(e)

func solution(_ s:String) -> Int {
    var numberOfCut: Int = 1
    var subString: [String] = [String]()
    var tempCount: Int = 0
    var tempWord: String = ""
    
    var itemTemp: String = ""
    var sameCount: Int = 1
    var resultWord: String = ""
    
    var minSize: Int = s.count
    
    while(numberOfCut <= s.count/2){
        print("numberOfCut: \(numberOfCut)")
            for i in s {
                tempWord += String(i)
                tempCount += 1
                if numberOfCut == tempCount {
                    subString.append(String(tempWord))
                    tempCount = 0
                    tempWord = ""
                }
            }
            
        if tempWord != "" {
            subString.append(tempWord)
        }
        
        tempWord = ""
        tempCount = 0
        
            print("subString\(subString)")
            
            for item in subString {
                if item == itemTemp {
                    sameCount += 1
                } else {
                    if itemTemp != "" {
                        resultWord += (sameCount > 1) ? "\(sameCount)\(itemTemp)" : "\(itemTemp)"
                    }
                    
                    itemTemp = item
                    sameCount = 1
                }
                print("resultWord:\(resultWord)")
            }
            
            if itemTemp != "" {
                resultWord += (sameCount > 1) ? "\(sameCount)\(itemTemp)" : "\(itemTemp)"
            }
            print("resultWord:\(resultWord)")
            
            if resultWord.count < minSize {
                minSize = resultWord.count
            }
            
            subString.removeAll()
            resultWord = ""
            itemTemp = ""
        
        numberOfCut += 1
    }
    
    print(minSize)
    return minSize
}
