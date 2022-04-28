import Foundation

var record: [String] = ["Enter uid1234 Muzi",
                        "Enter uid4567 Prodo",
                        "Leave uid1234",
                        "Enter uid1234 Prodo",
                        "Change uid4567 Ryan"]

solution(record)

func solution(_ record:[String]) -> [String] {
    var notification: [String] = []
    var nowNickName: [String: String] = [:]
    
    for noti in record {
        let command: [String] = noti.components(separatedBy: " ")
        
        if command.count > 2 {
            nowNickName[command[1]] = command[2]
        }
    }
    
    for noti in record {
        let command: [String] = noti.components(separatedBy: " ")
        let nickName = nowNickName[command[1]]!
        
        if command[0] == "Enter" {
            notification.append("\(nickName)님이 들어왔습니다.")
        } else if command[0] == "Leave" {
            notification.append("\(nickName)님이 나갔습니다.")
        }
    }

    return notification
}
