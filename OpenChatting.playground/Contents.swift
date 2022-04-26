import Foundation

var record: [String] = ["Enter uid1234 Muzi",
                        "Enter uid4567 Prodo",
                        "Leave uid1234",
                        "Enter uid1234 Prodo",
                        "Change uid4567 Ryan"]

solution(record)

func solution(_ record:[String]) -> [String] {
    //var result: [String] = []
    var notification: [(String, String)] = [(String, String)]()
    var nowNickName: [String: String] = [String: String]()
    
    for noti in record {
        let command: [String] = noti.components(separatedBy: " ")
        
        if command[0] == "Enter" {
            notification.append((command[1], "\(command[2])님이 들어왔습니다."))
            
            if nowNickName[command[1]] == nil {
                nowNickName[command[1]] = nowNickName[command[2]]
            } else {
                if nowNickName[command[1]] != command[2] {
                    for (i,noti) in notification.enumerated() {
                        if noti.0 == command[1] {
                            var notiSplit = noti.1.components(separatedBy: "님")
                            notification[i].1 = "\(command[2])님\(notiSplit[1])"
                        }
                    }
                }
            }
        } else if command[0] == "Leave" {
            notification.append((command[1], "\(nowNickName[command[1]])님이 나갔습니다."))
            
        } else if command[0] == "Change" {
            for (i,noti) in notification.enumerated() {
                if noti.0 == command[1] {
                    var notiSplit = noti.1.components(separatedBy: "님")
                    notification[i].1 = "\(command[2])님\(notiSplit[1])"
                }
            }
        }
    }
    
    print(notification)
    return []
}
