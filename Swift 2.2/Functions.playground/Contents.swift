//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//函数定义,无参数 ／ 无返回值 ／ 多参数 ／ 多返回值（元组）等 ／ 参数外部名称
func sayHello(personName: String) -> String {
    return "Hello, " + personName + "!";
}
sayHello("jc")

//参数缺省值
func sayHello(personName: String = "jc", alreadyGreeted: Bool = false) -> String {
    if alreadyGreeted {
        return sayHello(personName)
    } else {
        return "Hello, \(personName)"
    }
}
sayHello()

//可变参数
func arithmeticMean(numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1,2,3,4)
arithmeticMean(1,2,3,4,5)

//inout：传地址，函数中改变会影响外部调用等实参
func swapTwoInts(inout a: Int, inout _ b: Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt = 3
var anotherInt = 108
swapTwoInts(&someInt, &anotherInt)
print(someInt)
print(anotherInt)

//如果只是需要在函数内部改变形参的值，可以在函数参数定义前加var关键字，默认是let
func saySomeHello1(var personName: String) {
    personName = "Hello, " + personName
    print(personName)
}
saySomeHello1("jc")

func saySomeHello(personName: String) {
    //personName = "Hello, " + personName
}


//函数类型，实际也是一种数据类型，函数名代表了它的类型，类似c语言中的函数指针，
func addTwoInts(a: Int, b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(a: Int, b: Int) -> Int {
    return a * b
}

var mathFunction: (Int, Int) -> Int = addTwoInts
mathFunction(2,3)
mathFunction = multiplyTwoInts
mathFunction(2,3)

//既然是类型，自然也是可以作为函数参数或者函数返回值，已经嵌套定义的
func printMathResult(mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Resut: \(mathFunction(a,b))")
}
printMathResult(addTwoInts, 3, 4)

func chooseMathFunction(bIsAdd: Bool) -> (Int, Int) -> Int {
    if bIsAdd {
        return addTwoInts
    } else {
        return multiplyTwoInts
    }
}

var function = chooseMathFunction(false)
function(4,5)
function = chooseMathFunction(true)
function(4,5)

//nested
func chooseMathFunctionNested(bIsAdd: Bool) -> (Int,Int) -> Int {
    func addTwoIntsNested(a: Int, b: Int) -> Int {
        return a + b
    }
    
    func multiplyTwoIntsNested(a: Int, b: Int) -> Int {
        return a * b
    }
    
    if bIsAdd {
        return addTwoIntsNested
    } else {
        return multiplyTwoIntsNested
    }
}

function = chooseMathFunction(false)
function(4,5)
function = chooseMathFunction(true)
function(4,5)



















