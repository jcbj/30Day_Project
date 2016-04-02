//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//定义基类，基类可以不继承其它类
class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        // do nothing - an arbitrary vehicle doesn't necessarily make a noise
    }
}

let someVehicle = Vehicle()
print("Vehicle: \(someVehicle.description)")

//定义子类，继承基类
class Bicycle: Vehicle {
    var hasBasket = false
}

let bicycle = Bicycle()
//访问子类属性
bicycle.hasBasket = true
//子类访问父类属性
bicycle.currentSpeed = 15.0
print("Bicycle: \(bicycle.description)")
//定义子类的子类
class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()
//继承了所有父类的属性，所以可以直接访问
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("Tandem: \(tandem.description)")

class Train: Vehicle {
//    重写父类的方法
    override func makeNoise() {
        print("Choo Choo")
    }
}

let train = Train()
train.makeNoise()

class Car: Vehicle {
    var gear = 1
//    重写属性
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

let car = Car()
car.currentSpeed = 25.0
car.gear = 3
//访问的重写属性
print("Car: \(car.description)")

class AutomaticCar: Car {
//    重写属性，然后添加属性监测器
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar: \(automatic.description)")












