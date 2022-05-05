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

print("solution result \(solution(expresstion12))")

func solution(_ expression:String) -> Int64 {
    let threeFormulas: [[Character]] = [["+", "-", "*"],
                                        ["+", "*", "-"],
                                        ["-", "+", "*"],
                                        ["-", "*", "+"],
                                        ["*", "+", "-"],
                                        ["*", "-", "+"]]
    var numbers: [Int64] = []
    var formulas: [Character] = []
    var numberOfFormula: [Character: Int] = [:]
    var temp: String = ""
    
    for char in expression {
        if char == "+" || char == "-" || char == "*" {
            formulas.append(char)
            numbers.append(Int64(Int(temp)!))
            temp = ""
            numberOfFormula[char] = 0
        } else {
            temp.append(char)
        }
    }
    numbers.append(Int64(Int(temp)!))
    
    print(numberOfFormula)
    print(numbers)
    print(formulas)
    
    var result: Int64 = 0
    if numberOfFormula.count == 1 {
        let formula = numberOfFormula.first!.key
        if formula == "+" {
            result = abs(numbers.reduce(0) {
                return $0 + $1
            })
        } else if formula == "-" {
            result = abs(numbers.reduce(0) {
                return $0 - $1
            })
        } else if formula == "*" {
            result = abs(numbers.reduce(0) {
                return $0 * $1
            })
        }
    } else if numberOfFormula.count == 2 {
        let twoFormulas: [Character] = numberOfFormula.map({ $0.key })
        let twpFormulas_reverse: [Character] = twoFormulas.reversed()
        
        print(twoFormulas)
        //print(twpFormulas_reverse)
        
        let twoFormulas_result = Calc(priorityFormulas: twoFormulas, numbers: numbers, formulas: formulas)
        let twoFormulas_revers_result = Calc(priorityFormulas: twpFormulas_reverse, numbers: numbers, formulas: formulas)

        if abs(twoFormulas_result) > abs(twoFormulas_revers_result) {
            result = Int64(abs(twoFormulas_result))
        } else if(abs(twoFormulas_result) < abs(twoFormulas_revers_result)){
            result = Int64(abs(twoFormulas_revers_result))
        } else {
            result = Int64(abs(twoFormulas_result))
        }
    } else if numberOfFormula.count == 3 {
        var maxResult: Int64 = 0
        for f in threeFormulas {
            let result = Calc(priorityFormulas: f, numbers: numbers, formulas: formulas)
            if abs(result) > maxResult {
                maxResult = abs(result)
            }
        }
        
        result = Int64(abs(maxResult))
    }
    return result
}

func Calc(priorityFormulas: [Character], numbers: [Int64], formulas: [Character]) -> Int64 {
    var removeCount: Int = 0
    var temp: Int64 = 0
    var tempNumvers: [Int64] = numbers
    var tempFormulas: [Character] = formulas
    
    print("tempNumvers \(tempNumvers)")
    print("tempFormulas \(tempFormulas)")
    
    for f in priorityFormulas {
        removeCount = 0
        let tempFormulasCount = tempFormulas.count
        for i in 0..<tempFormulasCount {
            if tempFormulas[i - removeCount] == f {
                temp = Int64(sum(formula: f, a: tempNumvers[i-removeCount], b: tempNumvers[i+1-removeCount]))
                tempNumvers[i-removeCount] = temp
                tempNumvers.remove(at: i+1-removeCount)
                tempFormulas.remove(at: i-removeCount)
                removeCount += 1
            }
            
            print(tempNumvers)
            print(tempFormulas)
        }
    }
    
    print(tempNumvers[0])
    return tempNumvers[0]
}

func sum(formula: Character,a: Int64, b: Int64) -> Int64 {
    if formula == "+" {
        return Int64(a + b)
    } else if formula == "-" {
        return Int64(a - b)
    } else if formula == "*" {
        return Int64(a * b)
    }
    
    return 0
}
