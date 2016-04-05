//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//访问修饰符
public class SomePublicClass {}
internal class SomeInternalClass {}
private class SomePrivateClass {}

public var somePublicVariable = 0
internal let someInternalConstant = 0
private func somePrivateFunction() {}

// 默认：隐式访问级别 internal
class SomeInternalClass1 {}
// 默认：隐式访问级别 internal
var someInternalConstant1 = 0

//自定义类型访问级别控制
public class SomePublicClass2 {          // 显式的 public 类
    public var somePublicProperty = 0    // 显式的 public 类成员
    var someInternalProperty = 0         // 隐式的 internal 类成员
    private func somePrivateMethod() {}  // 显式的 private 类成员
}

class SomeInternalClass2 {               // 隐式的 internal 类
    var someInternalProperty = 0         // 隐式的 internal 类成员
    private func somePrivateMethod() {}  // 显式的 private 类成员
}

private class SomePrivateClass2 {        // 显式的 private 类
    var somePrivateProperty = 0          // 隐式的 private 类成员
    func somePrivateMethod() {}          // 隐式的 private 类成员
}

//函数参数有个访问级别为 private ,所以必须指明
//func someFunction() -> (SomeInternalClass, SomePrivateClass) {
//    // 此处是函数实现部分
//}

private func someFunction() -> (SomeInternalClass2, SomePrivateClass2) {
    // 此处是函数实现部分
    return (SomeInternalClass2(),SomePrivateClass2())
}

//枚举不能单独指定访问级别
public enum CompassPoint {
    case North
    case South
    case East
    case West
}

//通过重写为继承来的类成员提供更高的访问级别
public class A {
    private func someMethod() {}
}

internal class B: A {
    override internal func someMethod() {}
}

//在同一文件中，访问父类private级别成员
public class AA {
    private func someMethod() {}
}

internal class BB: AA {
    override internal func someMethod() {
        super.someMethod()
    }
}

//需要特别指明private
private var privateInstance = SomePrivateClass()

//只能在此源文件中修改numberOfEdits的值，其它地方无法修改
struct TrackedString {
    private(set) var numberOfEdits = 0
    var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
}

var stringToEdit = TrackedString()
stringToEdit.value = "This string will be tracked."
stringToEdit.value += " This edit will increment numberOfEdits."
stringToEdit.value += " So will this one."
print("The number of edits is \(stringToEdit.numberOfEdits)")

public struct TrackedString1 {
//    属性访问级别为public,而set设定为private
    public private(set) var numberOfEdits = 0
    public var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
    public init() {}
}









