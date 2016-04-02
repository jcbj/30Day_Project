//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//存储型属性
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}
//成员逐一构造函数
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6
rangeOfThreeItems.firstValue
rangeOfThreeItems.length

let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
//结构体是值类型，定义为常量后，它所有的属性都为常量，即使属性使用 var 修饰
//rangeOfFourItems.firstValue = 6

//延迟属性：在真正访问的时候才获取值，避免不必要的计算和性能开销
class DataImporter {
    /*
    DataImporter is a class to import data from an external file.
    The class is assumed to take a non-trivial amount of time to initialize.
    */
    var fileName = "data.txt"
    // the DataImporter class would provide data importing functionality here
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
    // the DataManager class would provide data management functionality here
}

let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
//真正使用时计算
print(manager.importer.fileName)

//计算型属性
struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    
//    定义一个计算型属性，不需要存储值
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        //newCenter可以省略，缺省值为 newValue 来表示新值
//        set(newCenter) {
//            origin.x = newCenter.x - (size.width / 2)
//            origin.y = newCenter.y - (size.height / 2)
//        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0),
    size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")


struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    //只读计算型属性，不能设置值，可以简写如下
    var volume: Double {
        return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")

//属性观察器
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()

stepCounter.totalSteps = 200
stepCounter.totalSteps

//类型属性：即此属性属于整个类型共享，而不是某个实例单独拥有，
//必须在定义的初始化，因为类型没有构造函数
struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}
enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}
class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}
//通过类型名加点来访问
print(SomeStructure.storedTypeProperty)

SomeStructure.storedTypeProperty = "Another value."
print(SomeStructure.storedTypeProperty)

print(SomeEnumeration.computedTypeProperty)

print(SomeClass.computedTypeProperty)








