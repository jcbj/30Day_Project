//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//定义
struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}
//实例化
let someResolution = Resolution()
let someVideoMode = VideoMode()
//定义为变量，所以可以修改
someVideoMode.resolution.height = 1024
print(someVideoMode.resolution.height)
//定义为常量，所以不可以修改
//someResolution.height = 1024
print(someResolution.height)



//结构体成员初始化函数
let vga = Resolution(width: 640, height: 480)

//结构体和枚举是值类型，拷贝的时候拷贝值
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd

cinema.width = 2048
cinema.width
hd.width

enum CompassPoint {
    case North, South, East, West
}
var currentDirection = CompassPoint.West
let rememberedDirection = currentDirection
currentDirection = .East
if rememberedDirection == .West {
    print("The remembered direction is still .West")
}

//类是引用类型，拷贝时增加引用计数
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0
tenEighty.frameRate

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

alsoTenEighty.frameRate
tenEighty.frameRate
//恒等和不等：引用是否指向同一个地址
if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}





