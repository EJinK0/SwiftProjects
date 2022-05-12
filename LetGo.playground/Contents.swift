import Foundation

var survey: [String] = ["AN", "CF", "MJ", "RT", "NA"]
var choices: [Int] = [5, 3, 2, 7, 5]

var survey2: [String] = ["TR", "RT", "TR"]
var choices2: [Int] = [7,1,3]

solution(survey2, choices2)

func solution(_ survey:[String], _ choices:[Int]) -> String {
    var scores: [(String, Int)] = [(String, Int)]()
    let mbti: [String] = ["RT", "CF", "JM", "AN"]
    var result: String = ""
    
    for (i,s) in survey.enumerated() {
        scores.append(Grading(s, choices[i]))
    }
    
    print(scores)
    
    for p in mbti {
        let fb = p[p.startIndex]
        let sb = String(p.last!)
        
        var fbSum = scores.filter{ $0.0 == String(fb) }.reduce(0){ $0 + $1.1 }
        var sbSum = scores.filter{ $0.0 == String(sb) }.reduce(0){ $0 + $1.1 }
        
        if fbSum > sbSum {
            result += String(fb)
        } else if fbSum == sbSum {
            result += String(fb)
        } else {
            result += String(sb)
        }
    }
    
    print(result)
    return result
}

func Grading(_ type: String, _ score: Int) -> (String, Int) {
    let first = type[type.startIndex]
    let second = String(type.last!)
    var result: (String, Int) = ("", 0)
    
    if score == 1 {
        result = (String(first), 3)
    } else if score == 2 {
        result = (String(first), 2)
    } else if score == 3 {
        result = (String(first), 1)
    } else if score == 4 {
        result = (String(first), 0)
    } else if score == 5 {
        result = (String(second), 1)
    } else if score == 6 {
        result = (String(second), 2)
    } else if score == 7 {
        result = (String(second), 3)
    }
    
    return result
}
