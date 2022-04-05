import Foundation

var n: Int = 12

solution(n)

func solution(_ n:Int) -> Int {
    var x:Int = 0
    for i in 1...n {
        if n % i == 1 {
            x = i
            break
        }
    }
    
    print(x)
    return x
}
