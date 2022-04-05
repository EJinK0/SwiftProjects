import Foundation

var n: Int = 1

solution(n)

func solution(_ n:Int) -> Int {
    var ternary: [Int] = [Int]()
    var share: Int = n
    var remain: Int = 0
    
    if n == 1 {
        return 1
    } else if n == 2 {
        return 2
    } else {
        while(share >= 3) {
            print(share)
            remain = share % 3
            share = share / 3
            
            ternary.append(remain)
        }
        
        ternary.append(share)
        
        print(ternary)
        
        var result: Int = 0
        
        for (index,i) in ternary.enumerated() {
            result += i * Int(pow(3.0, Double(ternary.count - index - 1)))
            print(Int(pow(3.0, Double(ternary.count - index - 1))))
        }
        print(result)
        return result
    }
}
