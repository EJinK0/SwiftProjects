import UIKit

var greeting = "Hello, playground"

var id_list: [String] = ["muzi", "frodo", "apeach", "neo"]
var report: [String] = ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"]
var k: Int = 2

var id_list2: [String] = ["con", "ryan"]
var report2: [String] = ["ryan con","ryan con","ryan con","ryan con"]
var k2: Int = 3

solution(id_list, report, k)

func solution(_ id_list: [String], _ report:[String], _ k:Int) -> [Int] {
    var reportResult_name: [String: [String]] = [String: [String]]()
    var reportResult_count: [String: Int] = [String: Int]()
    var beStopped: [String] = [String]()
    var result: [Int] = Array(repeating: 0, count: id_list.count)
    var ids: [String: Int] = [:]
    var i: Int = 0
    
    for id in id_list {
        reportResult_name[id_list[i]] = []
        reportResult_count[id_list[i]] = 0
        ids[id] = i
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
            
            if reportedCount >= k && !beStopped.contains(personReported) {
                beStopped.append(personReported)
            }
        }
    }
    for (key, value) in reportResult_name {
        for name in value {
            if beStopped.contains(name) {
                result[ids[key]!] += 1
            }
        }
    }
    return result
}
