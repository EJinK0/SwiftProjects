import Foundation

public class Person {
    var name: String = ""
    var age: Int = 0
    
    public init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    public var introduction: String {
        return "이름 \(name), 나이: \(age)"
    }
    
    public func speak() {
        print("가나다라마")
    }
}

public class Student: Person {
    public var grade: String = "F"
    
    public func study() {
        print("Study hard...")
    }
}
