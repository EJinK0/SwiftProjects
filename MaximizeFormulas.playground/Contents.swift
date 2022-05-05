import Foundation

let expresstion: String = "100-200*300-500+20"
let expresstion2: String = "50*6-3*2"
let expresstion3: String = "2+2+2+2"
let expresstion4: String = "5*5*1+4"
let expresstion5: String = "2-2-2-2"
let expresstion6: String = "2*2-3+2+4"
let expresstion7: String = "177-661*999*99-133+221+334+555-166-144-551-166*166-166*166-133*88*55-11*4+55*888*454*12+11-66+444*99"
let expresstion8: String = "2-990-5+2"
let expresstion9: String = "2-4-3+1"
let expresstion10: String = "4+3-2*1"
let expresstion11: String = "2+2*2+2*2"
let expresstion12: String = "0-1*0-1"

print("solution result \(solution(expresstion5))")

func solution(_ expression:String) -> Int64 {
    let threeFormulas: [[String]] = [["+", "-", "*"],
                                    ["+", "*", "-"],
                                    ["-", "+", "*"],
                                    ["-", "*", "+"],
                                    ["*", "+", "-"],
                                    ["*", "-", "+"]]
    
    var numberOfFormula: [String: Int] = [:]
    var exp: [String] = []
    var temp: String = ""
    
    for char in expression {
        if char == "+" || char == "-" || char == "*" {
            exp.append(temp)
            temp = ""
            exp.append(String(char))
            numberOfFormula[String(char)] = 0
        } else {
            temp.append(char)
        }
    }
    exp.append(temp)
    
    print("exp \(exp)")
    print("numbersOfFormula \(numberOfFormula)")
    
    var result: Int64 = 0
    if numberOfFormula.count == 1 {
        var formula: [String] = []
        formula.append(String(numberOfFormula.first!.key))
        result = calc(exp, priority: formula)
    } else if numberOfFormula.count == 2 {
        let twoFormulas: [String] = numberOfFormula.map({ $0.key })
        let twpFormulas_reverse: [String] = twoFormulas.reversed()
        
        let twoFormulas_result = calc(exp, priority: twoFormulas)
        let twoFormulas_revers_result = calc(exp, priority: twpFormulas_reverse)

        if abs(twoFormulas_result) > abs(twoFormulas_revers_result) {
            result = abs(twoFormulas_result)
        } else if(abs(twoFormulas_result) < abs(twoFormulas_revers_result)){
            result = abs(twoFormulas_revers_result)
        } else {
            result = abs(twoFormulas_result)
        }
    } else if numberOfFormula.count == 3 {
        var maxResult: Int64 = 0
        for f in threeFormulas {
            let result = calc(exp, priority: f)
            if result > maxResult {
                maxResult = result
            }
        }
        
        result = maxResult
    }
    return result
}

func calc(_ expression : [String], priority : [String]) -> Int64 {
    var expression = expression
    
    for op in priority {
        while ( expression.contains(op) ) {
            let idx = expression.firstIndex(of: op)!
            let operand = expression.remove(at: idx+1)
            switch op {
            case "+":
                expression[idx-1] = String(Int(expression[idx-1])! + Int(operand)!)
            case "-":
                expression[idx-1] = String(Int(expression[idx-1])! - Int(operand)!)
            default:
                expression[idx-1] = String(Int(expression[idx-1])! * Int(operand)!)
            }
            expression.remove(at: idx)
        }
    }
    return abs(Int64(expression.first!)!)
}
