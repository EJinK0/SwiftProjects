import UIKit

let yagom: Person = Person(name: "yagom", age: 99)
print(yagom.introduction)
yagom.speak()

let jay: Student = Student(name: "jay", age: 10)
jay.grade = "A"
print(jay.introduction)
jay.speak()
jay.study()
