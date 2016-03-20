//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//注意逗号的使用
enum CompassPoint {
    case North;    case South
    case East
    case West
}

var point = CompassPoint.North
point

enum Planet {
    case Mercury,Venus,Earth,Mars,Jupiter
}
//类型已经明确的时候，可以使用简写方式来赋值
point = .East
point

//switch语句中来匹配枚举的值，全覆盖，不匹配可以使用default
var directionToHead = CompassPoint.South
switch directionToHead {
case .North:
    print("Lots of planets have a north")
case .South:
    print("Watch out for penguins")
case .East:
    print("Where the sun rises")
case .West:
    print("Where the skies are blue")
}

let somePlanet = Planet.Earth
switch somePlanet {
case .Earth:
    print("Mostly harmless")
default:
    print("Not a safe place for humans")
}

//枚举关联值
enum Barcode {
    case UPCA(Int,Int,Int,Int)
    case QRCode(String)
}

var productBarcode = Barcode.UPCA(8, 85909, 51226, 3)
print(productBarcode)
//可以关联不同的值
productBarcode = .QRCode("ABCDEF")

//匹配
switch productBarcode {
case .UPCA(let numberSystem, let manufacturer, let product, let check):
    print("UPC-A: \(numberSystem), \(manufacturer), \(product), \(check).")
case .QRCode(let productCode):
    print("QR code: \(productCode).")
}

//可以把 let 放最前面
switch productBarcode {
case let .UPCA(numberSystem, manufacturer, product, check):
    print("UPC-A: \(numberSystem), \(manufacturer), \(product), \(check).")
case let .QRCode(productCode):
    print("QR code: \(productCode).")
}

//原始值
enum ASCIIControlCharacter: Character {
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}
print(ASCIIControlCharacter.Tab.rawValue)

enum Planet1: Int {
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}
print(Planet1.Saturn.rawValue)

//使用原始值来初始化枚举变量,注意返回值为可选类型，因为有可能使用不存在的原始值来初始化，所以可能为空
let possiblePlanet = Planet1(rawValue: 7)
print(possiblePlanet)


//此枚举类型可以存储三种算术表达式：纯数字，两个表达式相加，两个表达式相乘
//指明哪个成员可以递归
enum ArithmeticExpression {
    case Number(Int)
    indirect case Addition(ArithmeticExpression, ArithmeticExpression)
    indirect case Multiplication(ArithmeticExpression, ArithmeticExpression)
}

//指明所有成员都可以递归
indirect enum ArithmeticExpression1 {
    case Number(Int)
    case Addition(ArithmeticExpression1, ArithmeticExpression)
    case Multiplication(ArithmeticExpression1, ArithmeticExpression)
}

//使用递归函数来操作具有递归性质的数据结构
func evaluate(expression: ArithmeticExpression) -> Int {
    switch expression {
    case .Number(let value):
        return value
    case .Addition(let left, let right):
        return evaluate(left) + evaluate(right)
    case .Multiplication(let left, let right):
        return evaluate(left) * evaluate(right)
    }
}

// evaluate (5 + 4) * 2
let five = ArithmeticExpression.Number(5)
let four = ArithmeticExpression.Number(4)
let sum = ArithmeticExpression.Addition(five, four)
let product = ArithmeticExpression.Multiplication(sum, ArithmeticExpression.Number(2))
print(evaluate(product))












































