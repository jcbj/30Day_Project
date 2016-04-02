//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//for and for - in
for var i = 0; i < 5; i++ {
    print(i)
}

for i in 0...5 {
    print(i)
}

for _ in 0..<5 {
    print("Test")
}

let names = ["1","2","3","4"]
for name in names {
    print(name)
}

let numberOfLegs = ["spider":8,"ant":9]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName) - \(legCount)")
}

//while and repeat - while
var i = 0
while i < 5 {
    print(i++)
}

i = 0
repeat {
    print(i++)
} while i < 5

i = 20
if i < 10 {
    print("i < 10")
} else if i < 20 {
    print("i < 20")
} else {
    print("i >= 20")
}

//switch
let someCharacter: Character = "e"
switch someCharacter {
    case "a","e","i","o","u":
    print("\(someCharacter) is a vowel")
    case "b","c","d":
    print("\(someCharacter) is a consonant")
default:
    print("default")
}

switch someCharacter {
    //case "a"://不能为空语句，因为不存在隐式贯穿，也不回执行下面的匹配
    case "e":
    print("vowel")
default:
    print("default")
}

//临时常量，忽略，匹配范围，where，
let point = (2,0)
switch point {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (_,1):
    print("y = 1 line")
case (-2...2,-1..<1):
    print("rect")
case let (x,y) where x == y :
    print("(\(x),\(y))")
default:
    print("(\(point.0),\(point.1))")
}

var index = 25
gameLoop: while index < 30 {
    
    index++
    
    switch index {
    case 26:
        //贯穿到下条语句执行，相当于case 26,27:
        fallthrough
    case 27:
        print(index)
    case 28:
        //跳过本次循环，后面没有执行的语句，进入下一次循环gameLoop
        continue gameLoop
    case 29:
        //结束gameLoop指明的循环
        break gameLoop
    default:
        print(index)
    }
    print("continue: 跳过此条语句")
}
print("break：结束循环，跳转到这里")


func testGuard(count: Int) {
    guard count > 10 else {
        print("count <= 10")
        return
    }
    
    print(count)
}

testGuard(9)
















