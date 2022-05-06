import Foundation

var infos: [String] = ["java backend junior pizza 150",
                       "python frontend senior chicken 210",
                       "python frontend senior chicken 150",
                       "cpp backend senior pizza 260",
                       "java backend junior chicken 80",
                       "python backend senior chicken 50"]

var query: [String] = ["java and backend and junior and pizza 100",
                       "python and frontend and senior and chicken 200",
                       "cpp and - and senior and pizza 250",
                       "- and backend and senior and - 150",
                       "- and - and - and chicken 100",
                       "- and - and - and - 150"]

solution(infos, query)

func solution(_ info:[String], _ query:[String]) -> [Int] {
    var tempInfo: [String] = info
    var result: [Int] = []

    for (_,q) in query.enumerated() {
        let col:[String] = q.components(separatedBy: " ").filter{$0 != "and"}
        print(col)
        
        for (j,c) in col.enumerated() {
            if c == "-" {continue}
            if j == 4 {
                result.append(BinarySearch(tempInfo, Int(c)!))
            } else {
                tempInfo = tempInfo.filter {$0.contains(c)}
            }
        }

        tempInfo = info
    }
    
    print(result)
    return result
}

func BinarySearch(_ infos:[String],_ score: Int) -> Int {
    var scores: [Int] = []
    
    var startIdx: Int = 0
    var endIdx: Int = infos.count
    var serchIndex: Int = infos.count / 2
    
    for i in infos {
        scores.append(Int(i.components(separatedBy: " ").last!)!)
    }
    scores = scores.sorted(by: <)
    
    while startIdx < endIdx {
        serchIndex = (startIdx + endIdx) / 2
        if score <= scores[serchIndex] {
            endIdx = serchIndex
        } else {
            startIdx = serchIndex + 1
        }
    }
    
    return infos.count - endIdx
}
