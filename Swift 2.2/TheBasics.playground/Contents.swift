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

//类型安全和类型推断
let meaningOfLife = 42  //Int
let pi = 3.1415926 //Double
let anotherPi = 3 + 0.1415926
//meaningOfLife = 3.0

let decimalInt = 17
let binaryInt = 0b10001
let octalInt = 0o21
let hexadecimalInt = 0x11

let exponentDouble = 1.25e-2

let value1 = 0xFp2
let value2 = 0xFp-2

let paddedDouble = 000123.456
let oneMillion = 1_000_000

//let cannotBeNegative: UInt8 = -1
//let tooBig: Int8 = Int8.max + 1

let twoThousand: UInt16 = 2000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)

let threePointOneFour = 3.14
let integerPi = Int(threePointOneFour)

let three = 3
let pointOneFourOneFiveNine = 0.14159
//类型推断3为Double
let pi2 = 3 + pointOneFourOneFiveNine
//three已经在定义的时候推断为Int，所以这里不可以
//let pi3 = (three) + pointOneFourOneFiveNine

typealias AudioSample = UInt16
var maxAudioSample = AudioSample.max
UInt16.max

let i = 1
if i == 1 {
    print("true")
}
/*
if i {
    print("Error")
}
*/

let http404Error = (404,"Not Found")
//解包
let (statusCode, statusMessage) = http404Error
print("\(statusCode) - \(statusMessage)")
//忽略一部分
let (_, justStatusMessage) = http404Error
print("\(justStatusMessage)")
//使用索引
print("\(http404Error.0) - \(http404Error.1)")
//定义变量名
let http200Status = (statusCode: 200, description: "OK")
print("\(http200Status.statusCode) - \(http200Status.description)")

//字符串转数字，实际是可选类型
var possibleNumber = "123"
var convertedNumber = Int(possibleNumber)
print(convertedNumber)

possibleNumber = "Hello"
convertedNumber = Int(possibleNumber)
//? : 有就获取值，没值就返回nil
convertedNumber?.description
//可赋值为nil
convertedNumber = nil
//默认初始化为nil
var surveyAnswer: String?
//为nil，强制解包出错
print(surveyAnswer)
surveyAnswer = "optional"

if surveyAnswer != nil {
    print("surveyAnswer = \(surveyAnswer)")
    let test1 = surveyAnswer
    let test2 = surveyAnswer!
    test1?.debugDescription  //直接赋值，可选类型,所以需要？
    test2.debugDescription   //强制解包以后，即获得的普通值，不需要？
    
    surveyAnswer!
}

//可选绑定
possibleNumber = "345"
if let actualNumber = Int(possibleNumber) {
    print(actualNumber.description)
}

if let firstNumber = Int("4"), secondNumber = Int("34") where firstNumber < secondNumber {
    print("\(firstNumber) < \(secondNumber)")
}

//隐式可选，一旦赋值，值不为空，
let possibleString: String? = "An optional string."
//因为前面常量定义了类型，右边不解包的话为可选类型，所以无法赋值，使用！解包为普通值即可赋值
//let forcedString: String = possibleString

let assumedString: String! = "An implicitly unwrapped optional string."
//注意和上面比较，这里没有解包，但获得的却是实际值，所以可以直接赋值
//隐式可选不赋初始值时不可以的
let implicitString: String = assumedString

//隐式可选和普通可选一样，可以在 if语句 中做判断或可选绑定
if assumedString != nil {
    print(assumedString)
}

if let definiteString = assumedString {
    print(definiteString)
}


//Error Handing
enum MyCustomErrorType: ErrorType {
    case ErrorReason1
    case ErrorReason2
    case ErrorReason3
}

func canThrowAnError(count: Int) throws {
    if count < 5 {
        throw MyCustomErrorType.ErrorReason1
    } else if count < 15 {
        throw MyCustomErrorType.ErrorReason2
    } else {
        throw MyCustomErrorType.ErrorReason3
    }
}

do {
    try canThrowAnError(3)
    //do something
} catch MyCustomErrorType.ErrorReason1 {
    print("\(MyCustomErrorType.ErrorReason1)")
} catch {
    print(error)
}

try? canThrowAnError(10)

//断言
var age = 3
assert(age >= 0)
age = -3
assert(age >= 0,"A person's age cannot be less than zero")

























