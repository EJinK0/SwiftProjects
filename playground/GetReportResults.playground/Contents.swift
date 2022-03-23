import UIKit

var greeting = "Hello, playground"

var id_list: [String] = ["muzi", "frodo", "apeach", "neo"]
var report: [String] = ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"]
var k: Int = 2

solution(id_list, report, k)

func solution(_ id_list: [String], _ report:[String], _ k:Int) -> [Int] {
    var reportResult_name: [String: [String]] = [String: [String]]()
    var reportResult_count: [String: Int] = [String: Int]()
    
    var i: Int = 0
    
    for _ in id_list {
        reportResult_name[id_list[i]] = []
        reportResult_count[id_list[i]] = 0
        i += 1
    }

    for data in report {
        let names = data.split(separator: " ").map { String($0) }
        let whoReport: String = names[0]
        let personReported: String = names[1]
        
        var reportedPerson: [String] = reportResult_name[whoReport]!
        if(!reportedPerson.contains(personReported)) {
            reportedPerson.append(personReported)
            reportResult_name[whoReport] = reportedPerson
            
            var reportedCount: Int = reportResult_count[personReported]!
            reportedCount += 1
            reportResult_count[personReported] = reportedCount
        }
    }
    
    var beStopped: [String] = [String]()
    for (key, value) in reportResult_count {
        if value >= k {
            beStopped.append(key)
        }
    }
    
    var notiCounts : [String: Int] = [String: Int]()
    var k: Int = 0
    
    for (key, value) in reportResult_name {
        let ids: [String] = value
        for name in ids {
            if beStopped.contains(name) {
                k += 1
            }
        }
        notiCounts[key] = k
        k = 0
    }
    
    var result: [Int] = [Int]()
    for id in id_list {
        result.append(notiCounts[id]!)
    }

    return result
}
