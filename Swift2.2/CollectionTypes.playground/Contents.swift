//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//Array == NSArray
//定义一个空数组
var someInts = [Int]()
//如果类型确定，也可以简化如下，数组为空
someInts = []

//定义大小并赋相同的初始值
var threeDoubles = [Double](count: 3, repeatedValue: 2.5)
//根据类型推断，直接赋不同初始值
var anotherDoubles = [0.0,0.0,0.0]
//重载了加操作符，所有类型相同的数组可以直接链接起来
var sixDouble = threeDoubles + anotherDoubles;


//指明类型并赋初始值
var shoppingList: [String] = ["Eggs","Milk"]
//推断，可以不指明类型
var shoppingList1 = ["Eggs","Milk"]

//访问：下标和函数
shoppingList.count
shoppingList.isEmpty
shoppingList.append("Flour")
shoppingList += ["Baking Powder","Apple"]
shoppingList[0]
shoppingList[0] = "Bananas"
//类似python中切片，替换范围中的值，二者数量可以不同
shoppingList[1...3] = ["1","2","3","4"]
shoppingList
//插入
shoppingList.insert("Maple Syrup Insert", atIndex: 2)

//删除，返回值为删除时的值
let mapleSyrup = shoppingList.removeAtIndex(2)
let bananas = shoppingList.removeFirst()
let apple = shoppingList.removeLast()
//shoppingList.removeAll()
shoppingList

//循环迭代
for item in shoppingList {
    print(item)
}
//同时获取索引和值
for (index,value) in shoppingList.enumerate() {
    print("\(index),\(value)")
}

//Set == NSSet; Unorder, hashable, only
//定义Set，使用尖括号指明类型
var letters = Set<Character>()
//字符也适用双引号
letters.insert("a")
//字符值 必须用双引号括起来， 必须是一个字符
//let char: Character = 'b'




//完整写法
var favoriteGenres: Set<String> = ["Rock","Classical","Hip hop"]
//简写
var favoriteGenres1: Set = ["1","2"]
//访问，只能插入，没有下标，
favoriteGenres.count
favoriteGenres.isEmpty
favoriteGenres.insert("4")
favoriteGenres.insert("Rock")

//删除返回可选值，有可能删除不存在的元素
if let removeItem = favoriteGenres.remove("4") {
    print(removeItem)
}

//是否包含
if favoriteGenres.contains("Rock") {
    print("Rock")
}
//循环获取值，无序
for genera in favoriteGenres {
    print(genera)
}

//排序后获取值
for genera in favoriteGenres.sort() {
    print(genera)
}

var a: Set = [1,2,3,4]
var b: Set = [3,4,5,6,7]

//交集
a.intersect(b)
//异或
a.exclusiveOr(b)
//并集
a.union(b)
//差集
a.subtract(b)

var aa: Set = [1,2,3,4,5]
var bb: Set = [3,4]
var cc: Set = [1,2,6,7]
//子集
bb.isSubsetOf(aa)
//超集
aa.isSupersetOf(bb)
//不相交
bb.isDisjointWith(cc)


//Dictionary == NSDictionary
var nameOfInt = [Int : String]()
nameOfInt[1] = "1111"
//已经定义，通过赋值赋为空
nameOfInt = [:]

var airports: [String : String] = ["1":"111","2":"222"]
//简化版
airports = ["3":"33","4":"44"]
airports.count
airports.isEmpty
//访问与修改
airports["3"]
airports["3"] = "55"
airports
//如果不存在则添加
airports["7"] = "77"
airports
//访问不存在，返回值时可选，实际为nil
airports["8"]
//删除
airports.removeValueForKey("8")
//循环，同时获取键和值
for (key,value) in airports {
    print("\(key),\(value)")
}

for key in airports.keys {
    print(key)
}

for value in airports.values {
    print(value)
}
//将键或值转化为数组
let keys = [String](airports.keys)
let value = [String](airports.values)












































