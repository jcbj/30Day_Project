//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let names = ["Chris","Alex","Ewa","Barry","Daniells"]

func backwards(s1: String, _ s2: String) -> Bool {
    return s1 > s2;
}
//调用函数
var reversed = names.sort(backwards)
//标准闭包
reversed = names.sort({(s1: String, s2: String) -> Bool in
    return s1 > s2
})
//单语句可以写一行
reversed = names.sort({(s1: String, s2: String) -> Bool in return s1 > s2 } )
reversed
//类型推断，省略类型说明，同时括号，箭头都省略
reversed = names.sort({s1,s2 in return s1 > s2})
//单语句，隐式会作为返回值，return省略
reversed = names.sort({s1, s2 in s1 > s2 })
//使用隐式参数引用
reversed = names.sort({ $0 > $1 })
//重载了操作符，参数省略
reversed = names.sort(>)
reversed

//尾随闭包
let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]
//调用函数只有闭包唯一参数时，（）可以省略
let strings = numbers.map {
    (number) -> String in
    var number = number
    var output = ""
    while number > 0 {
        output = digitNames[number % 10]! + output
        number /= 10
    }
    return output
}

//值捕获，自由变量
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
incrementByTen()
incrementByTen()

let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()

incrementByTen()
//引用类型，所以值是在上次基础上继续增加的
let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()

//逃逸闭包，下面的闭包可以在someFunctionWithEscapingClosure结束后继续调用
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: () -> Void) {
    completionHandlers.append(completionHandler)
}

//使用@noescape关键字，特别指明，不允许逃逸
func someFunctionWithNonescapingClosure(@noescape closure: () -> Void) {
    closure()
}

//自动闭包，可以延迟计算，到真正需要用的时候才执行，
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)

let customerProvider = { customersInLine.removeAtIndex(0) }
print(customersInLine.count)

print("Now serving \(customerProvider())!")

print(customersInLine.count)





















