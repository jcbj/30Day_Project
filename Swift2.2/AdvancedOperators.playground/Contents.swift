//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//按位取反
let initialBits: UInt8 = 0b00001111
let invertedBits = ~initialBits

//按位与，同时为1才为1
let firstSixBits: UInt8 = 0b11111100
let lastSixBits: UInt8  = 0b00111111
let middleFourBits = firstSixBits & lastSixBits

//按位或，有一个为1即为1
let someBits: UInt8 = 0b10110010
let moreBits: UInt8 = 0b01011110
let combinedbits = someBits | moreBits

//按位异或，相同为0，不同为1
let firstBits: UInt8 = 0b00010100
let otherBits: UInt8 = 0b00000101
let outputBits = firstBits ^ otherBits

//左移或右移，相当于乘2或除2
let shiftBits: UInt8 = 4   // 00000100 in binary
shiftBits << 1             // 00001000
shiftBits << 2             // 00010000
shiftBits << 5             // 10000000
shiftBits << 6             // 00000000
shiftBits >> 2             // 00000001

let pink: UInt32 = 0xCC6699
let redComponent = (pink & 0xFF0000) >> 16    // redComponent is 0xCC, or 204
let greenComponent = (pink & 0x00FF00) >> 8   // greenComponent is 0x66, or 102
let blueComponent = pink & 0x0000FF           // blueComponent is 0x99, or 153

//溢出报错，需使用溢出运算符
//var potentialOverflow = Int16.max
//potentialOverflow += 1

var unsignedOverflow = UInt8.max
//向上溢出，变最小值
unsignedOverflow = unsignedOverflow &+ 1
//向下溢出，变最大值
unsignedOverflow = unsignedOverflow &- 1

//有符号整数
print("\(Int8.min),\(Int8.max)")
var signedOverflow = Int8.min
signedOverflow = signedOverflow &- 1
signedOverflow = Int8.max
signedOverflow = signedOverflow &+ 1

//优先级及结合性
2 + 3 % 4 * 5

//运算符重载
struct Vector2D {
    var x = 0.0, y = 0.0
}
//类似定义了全局函数，函数名即为重载的操作符，中缀操作符
func + (left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: left.y + right.y)
}

let vector = Vector2D(x: 3.0, y: 1.0)
let anotherVector = Vector2D(x: 2.0, y: 4.0)
//直接使用
let combinedVector = vector + anotherVector

//前缀或后缀操作符，prefix or postfix
prefix func - (vector: Vector2D) -> Vector2D {
    return Vector2D(x: -vector.x, y: -vector.y)
}

let positive = Vector2D(x: 3.0, y: 4.0)
let negative = -positive

let alsoPositive = -negative

//复合赋值
func += (inout left: Vector2D, right: Vector2D) {
    left = left + right
}

var original = Vector2D(x: 1.0, y: 2.0)
let vectorToAdd = Vector2D(x: 3.0, y: 4.0)
original += vectorToAdd

//是否相等判断
func == (left: Vector2D, right: Vector2D) -> Bool {
    return (left.x == right.x) && (left.y == right.y)
}
func != (left: Vector2D, right: Vector2D) -> Bool {
    return !(left == right)
}

let twoThree = Vector2D(x: 2.0, y: 3.0)
let anotherTwoThree = Vector2D(x: 2.0, y: 3.0)
if twoThree == anotherTwoThree {
    print("These two vectors are equivalent.")
}

//自定义操作符
//声明
prefix operator +++ {}
//实现
prefix func +++ (inout vector: Vector2D) -> Vector2D {
    vector += vector
    return vector
}
//使用
var toBeDoubled = Vector2D(x: 1.0, y: 4.0)
let afterDoubling = +++toBeDoubled

//设置操作符的优先级
infix operator +- { associativity left precedence 140 }
func +- (left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: left.y - right.y)
}
let firstVector = Vector2D(x: 1.0, y: 2.0)
let secondVector = Vector2D(x: 3.0, y: 4.0)
let plusMinusVector = firstVector +- secondVector

