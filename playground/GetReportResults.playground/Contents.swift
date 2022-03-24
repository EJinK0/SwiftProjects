import UIKit
import CoreGraphics

var greeting = "Hello, playground"

var id_list: [String] = ["muzi", "frodo", "apeach", "neo"]
var report: [String] = ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"]
var k: Int = 2

solution(id_list, report, k)

func solution(_ id_list: [String], _ report:[String], _ k:Int) -> [Int] {
    var reportResult_name: [String: [String]] = [String: [String]]()
    var reportResult_count: [String: Int] = [String: Int]()
    var beStopped: [String] = [String]()
    var notiCounts : [String: Int] = [String: Int]()
    var j: Int = 0

    for data in report {
        let names = data.split(separator: " ").map { String($0) }
        let whoReport: String = names[0]
        let personReported: String = names[1]
        
        var reportedPerson: [String] = reportResult_name[whoReport] ?? []
        if(!reportedPerson.contains(personReported)) {
            reportedPerson.append(personReported)
            reportResult_name[whoReport] = reportedPerson
            
            var reportedCount: Int = reportResult_count[personReported] ?? 0
            reportedCount += 1
            reportResult_count[personReported] = reportedCount
            
            if reportedCount >= k && !beStopped.contains(personReported) {
                beStopped.append(personReported)
            }
        }
    }
    
    for (key, value) in reportResult_name {
        let ids: [String] = value
        for name in ids {
            if beStopped.contains(name) {
                j += 1
            }
        }
        notiCounts[key] = j
        j = 0
    }
    
    var result: [Int] = [Int]()
    for id in id_list {
        result.append(notiCounts[id] ?? 0)
    }

    return result
}
