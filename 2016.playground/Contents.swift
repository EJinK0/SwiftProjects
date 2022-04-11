import UIKit
import Foundation

var a = 5
var b = 24

var a2 = 1
var b2 = 2


solution(a2,b2)

func solution(_ a:Int, _ b:Int) -> String {
    let day: [String] = ["SUN","MON","TUE","WED","THU","FRI","SAT"]
    let months: [Int] = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    let dayOfTheWeekNum: Int = 5
    var sum: Int = 0
    
    if a == 1 {
        sum += b
    } else {
        for i in 0...a-2 {
            sum += months[i]
        }
        sum += b
    }
    
    var remain: Int = sum % 7
    print(remain)
    
    remain += dayOfTheWeekNum
    
    remain = remain % 7
    
    print(remain)
    
    var dayOfTheWeek: String = ""
    if remain == 0 {
        dayOfTheWeek = day[6]
    } else {
        dayOfTheWeek = day[remain-1]
    }
    
    print(dayOfTheWeek)
    return dayOfTheWeek
}
