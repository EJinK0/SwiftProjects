import Foundation

var p: String = "(()())()"
var p2: String = ")("
var p3: String = "()))((()"
var p4: String = "(()())()()))((()"
var p5: String = ")()(()"
var p6: String = ""
var p7: String = "))))(((("
var p8: String = ")))((()))((("
var p9: String = ")((()(()))"
var p10: String = "(()))))((("

print("transform \(transform(p10))")

func isRightMach(_ p: String) -> Bool {
    var stack: [String] = []
    var tempP = p
    
    while tempP.isEmpty == false {
        let x = String(tempP.removeFirst())
        
        if stack.isEmpty {
            stack.append(x)
        } else if stack.last! == "(" && x == ")" {
            stack.removeLast()
        } else {
            stack.append(x)
        }
    }
    return stack.isEmpty
}

func transform(_ p : String) -> String {
    if p.isEmpty { return ""}
    else if isRightMach(p) { return p }
    
    var v = p
    var u = String(v.removeFirst())
    
    while u.filter{$0 == "("}.count != u.filter{$0 == ")"}.count{
        let x = v.removeFirst()
        u.append(x)
    }
    
    if isRightMach(u) { // 3번
        return u + transform(v)
    } else {
        var tmp = "(" + transform(v) + ")"
        
        u.removeFirst()
        u.removeLast()
        u = u.map{
            if $0 == "(" { return ")" }
            else { return "(" }
        }.reduce(""){$0 + $1}
        return tmp + u
    }
}
