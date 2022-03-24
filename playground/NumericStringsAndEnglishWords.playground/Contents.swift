import UIKit

var string: String = "one4seveneight"
var string2: String = "23four5six7"

solution(string2)

func solution(_ s: String) -> Int {
    let numbers: [String: String] = ["0":"zero","1":"one","2":"two","3":"three","4":"four","5":"five","6":"six","7":"seven","8":"eight","9":"nine"]
    
    var word: String = ""
    var result: String = ""
    
    for char in s {
        word = word + String(char)
        if numbers.keys.contains(word) {
            result = result + word
            word = ""
        } else if(numbers.values.contains(word)) {
            for (key, value) in numbers {
                if value == word {
                    result = result + key
                    word = ""
                    break
                }
            }
        }
    }
    let result2: Int = Int(result)!
    return result2
}

