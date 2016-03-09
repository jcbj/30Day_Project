//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0
//常量赋值以后不可以改变
//maximumNumberOfLoginAttempts = 9
currentLoginAttempt++
currentLoginAttempt
//可以在一行定义多个变量
var x = 0.0, y = 0, z = 0.0

//类型说明,前面都是根据所赋值推断出类型，下面是明确指明
var welcomeMessage: String
welcomeMessage = "Hello"
var red, green, blue: Double
//不可以即不赋值，也不指明类型
//var error

//变量命名,奇怪的名字测试下即可，还是要使用有意义的变量命名。
let π = 3.1415926
let 你好 = "你好，世界！"
let 🐶🐮 = "dogcow"
print(你好)
print(🐶🐮)

//打印
print(welcomeMessage)
print("The current value of welcomeMessage is \(welcomeMessage)")

//注释: 单行，多行，多行嵌套[但/* and */必须配套]
//this is a comment

/* this is also a comment,
 but written over multiple lines
*/

/* this is the start of the first multiline comment
/* this is the second, nested multiline comment
this is the end of the first multiline comment */
//少一个 * and /, 导致后面都被注释了
let c = 1
*/

//Semicolons
let cat = "🐱";print(cat)

//Int
let minValue = Int.min
let maxValue = Int.max

let minInt64Value = Int64.min
let maxInt32Value = Int32.max

let minUIntValue = UInt.min
let maxUIntValue = UInt.max
//No min and max
let minFloatValue = Float.NaN
let maxDoubleValue = Double.quietNaN




















