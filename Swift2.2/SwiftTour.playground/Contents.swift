//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var shoppingList = ["catfish","water","tulips","blue paint"]
shoppingList[1] = "bottle of water"
shoppingList

var occupations = [
    "Malcolm" : "Captain",
    "Keylee" : "Mechanic"
]
occupations["No Exist"] //返回实际数可选值，如果引用不存在的键，返回nil
occupations["Keylee"] = "test"
occupations

let emptyArray = [String]()
let emptyDictionary = [String:Float]()

//如果变量类型明确，也可以使用下面的方式清空，注意它们的类型，虽然没有明确指明，但默认是和原来类型相同
shoppingList = []
occupations = [:]
shoppingList.count
occupations.count

//shoppingList.append(1)
//occupations[1] = "2"

let individualScores = [75,43,100,38,98]
var tempScore = 0
for score in individualScores {
    if score > 50 { //此处判断条件必须是Bool类型值
        tempScore += 3
    } else {
        tempScore += 1
    }
}
print(tempScore)

var optionalString: String?
print(optionalString)

if let temp = optionalString {
    print("optionalString is \(temp)")
} else {
    print("optionalString is nil.")
}

//如果不判断，直接使用会出错
//var temp = optionalString! + ",world!"

let nickName: String? = nil
let fullName: String = "John Applessed"
let informalGreeting = "Hi \(nickName ?? fullName)"
//上面??类似下面语句简写
let tempName = (nickName != nil) ? nickName:fullName
//注意此处tempName是一个可选值
let informalGreeting1 = "Hi,\(tempName)"
let informalGreeting2 = "Hi,\(tempName!)"

//switch
let vegetable = "red pepper"
switch vegetable {
    case "celery":
        print("Add some raisins and make ants on a log.")
    case "cucumber","watercress":           //可以接多个匹配项
        print("That would make a good tea sandwich.")
    case let x where x.hasSuffix("pepper"):     //可以使用条件过滤
        print("Is it a spicy \(x)?")         //不会主动贯穿分支
        fallthrough                               //使用fallthrough才会进入后续分支
    default:                                      //必须全覆盖
        print("Everything tastes good in soup.")
}

//for-in,遍历字典和数组
let interestingNumbers = [
    "Prime": [2,3,5,7,11,13],
    "Fibonacci": [1,1,2,3,5,8],
    "Square":[1,4,9,16,25]
]

var largest = 0
for (kind,numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)

//while and repeat - while
var n = 2
while n < 100 {
    n = n * 2
}
print(n)

var m = 2
repeat {
    m = m * 2
} while m < 100
print(m)

var total = 0
for i in 0..<4 { //小于
    total += i
}
print(total)

total = 0
for i in 0...4 { //小于等于
    total += i
}
print(total)

//Functions and Closures
//func 函数名(参数名: 参数类型,...) -> 返回值类型 {
func greet(name: String, day: String) -> String {
    return "Hello \(name), today is \(day)."
}
greet("Bob",day: "Tuesday")

//利用元组，返回多个值，并且类型可以自由组合
func calculateStatistics(scores:[Int]) -> (min: Int, max: Int, sum: Int) {
    guard scores.count > 0 else {
        print("scores is empty.")
        return (0,0,0)
    }
    
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    
    return (min,max,sum)
}

let statistics = calculateStatistics([5,3,100,3,9])
//元组的访问方式
print(statistics.0)
print(statistics.1)
print(statistics.2)
print(statistics.sum)

//变长参数列表，在最后一个参数类型后面➕...
func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf()
sumOf(42,54,99)

//嵌套函数
func returnFifteen() -> Int {
    var y = 10
    
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

//函数也是一种类型，可作为参数或函数返回值等
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne //返回函数名
}
var increment = makeIncrementer()
//注意此时increment的类型，实际是一种函数类型 (Int) -> Int
increment(7)

//注意此处condition类型，是一种函数类型 (Int) -> Bool
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    
    return false
}

func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20,19,7,12]
hasAnyMatches(numbers, condition: lessThanTen)

//函数是一种特殊的闭包，闭包一些简写形式
numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})
//尾随闭包
print(numbers)
let mappedNumbers1 = numbers.map{
    (number: Int) -> Int in
    let result = 3 * number
    return result
}
print(mappedNumbers1)

//省略参数类型，单语句默认返回此语句的值，所以return语句也省略
let mappedNumbers2 = numbers.map{ number in 3 * number}
print(mappedNumbers2)
//使用参数的简写形式来引用参数，省略return
let sortedNumbers = numbers.sort{ $0 > $1 }
print(sortedNumbers)

//Objects and Classes
//存储型属性必须初始化，定义时或者在初始化函数中赋值，否则报错
class Shape {
    var numberOfSides: Int
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    
    init(numberOfSides: Int = 0)
    {
        self.numberOfSides = numberOfSides
    }
    //析构函数，对象销毁前调用，执行最后的清理工作
    deinit{
        
    }
}
var shape = Shape()
shape.numberOfSides

var shape1 = Shape(numberOfSides: 1)
shape1.numberOfSides

//类继承
class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    //析构函数
    deinit{
        self.name = ""
    }
}

//类继承
class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        //1.先给子类属性赋值
        self.sideLength = sideLength
        //2.再调用父类初始化函数
        super.init(name: name)
        //3.然后给父类属性赋值
        self.numberOfSides = 4
        //如果没有3，则2也可以省略，系统会自动调用2
    }
    
    func area() -> Double {
        return self.sideLength * self.sideLength
    }
    //重写父类方法override
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}
let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()

//在属性上使用get / set
class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * self.sideLength
        }
        //类型前面已经定义，此处不用也不能再限定类型
        //set (autoUserValue: Double) {
        set (autoUserValue) {
            //default: newValue
            //sideLength = newValue / 3.0
            sideLength = autoUserValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.perimeter)

//如果需要单纯的对属性进行监视，可以使用 willSet / didSet
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            print("triangel is willSet")
            self.square.sideLength = newValue.sideLength
        }
    }
    
    var square: Square {
        willSet {
            print("square is willSet.")
            self.triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size: Double, name: String) {
        self.square = Square(sideLength: size, name: name)
        self.triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)

//可选链
var optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
//可选值不为空，正常执行
let sideLength = optionalSquare?.sideLength
optionalSquare = nil
//可选值为空，不执行后面的，并且不会报错
optionalSquare?.sideLength

//枚举像类和其它类型一样，可以有方法，case的作用？？
enum Rank: Int {
    case Ace = 1
    case Two,Three,Four,Five,Six,Seven,Eight,Nine,Ten
    case Jack,Queen,King
    
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.Ace
let aceRawValue = ace.rawValue
//缺省值上默认递增的
var rawValue = Rank.Three.rawValue
rawValue = Rank.Jack.rawValue
//初始值可能不存在，所以要加判断
if let convertedRank = Rank(rawValue: 4) {
    let fourDescription = convertedRank.simpleDescription()
}

enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
}
let hearts = Suit.Hearts
let heartsDesciption = hearts.simpleDescription()
//枚举值实际就是它自身的值，并没有其它途径读写其原始值，如果没有也不用给它提供原始值？？
//print(hearts.rawValue)

//结构体和类最大的区别就是一个是值类型，一个引用类型
struct Card {
    var rank: Rank
    var suit: Suit
    
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .Three, suit: .Spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

//枚举可以关联值
enum ServerRespone {
    case Result(String, String)
    case Failure(String)
    
    func simpleDescription() {
        
        switch self {
        case let .Result(sunrise, sunset):
            print("Sunrise is at \(sunrise) and sunset is at \(sunset)")
        case let .Failure(message):
            print("Failure... \(message)")
        }
    }
}
let success = ServerRespone.Result("6:00 am", "8:09 pm")
let success1 = ServerRespone.Result("6:09 am", "8:19 pm")
let failure = ServerRespone.Failure("Out of cheese.")

success.simpleDescription()
success1.simpleDescription()
failure.simpleDescription()

//协议和扩展
protocol ExampleProtocol {
    var simpleDescription: String { get }
    //注意此处mutating的使用，如果要修改自身，要考虑到被结构体实现的问题
    mutating func adjust()
    //func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    
    func adjust() {
        self.simpleDescription += " Now 100% adusted."
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    
    mutating func adjust() {
        self.simpleDescription += " (adusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

//使用扩展可以对现有类型添加新的方法和计算属性，但不能添加存储属性
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescription)
var i = 7
i.adjust()
i.simpleDescription

//协议实际也是一种自定义类型，所以也可以作为参数或返回值使用
let protocolValue: ExampleProtocol = a
print(protocolValue.simpleDescription)
//此时不能访问协议以为的属性和方法
//print(protocolValue.anotherProperty)

//自定义Error
enum PrinterError: ErrorType {
    case OutOfPaper
    case NoToner
    case OnFire
}
//在函数中抛出error
func sendToPrinter(printName: String) throws -> String {
    if printName == "Never Has Toner" {
        throw PrinterError.NoToner
    }
    return "Job sent"
}
//捕获error
func testCatchError(name: String) {
    do {
        let printerRespone = try sendToPrinter(name)
        print(printerRespone)
    } catch {
        print(error)
    }
}
testCatchError("Bi Sheng")
testCatchError("Never Has Toner")

//可以设置多个catch
func testMultipleCatchError(name: String) {
    do {
        let pRespone = try sendToPrinter(name)
        print(pRespone)
    } catch PrinterError.OnFire {
        print("I'll just put this over here, with the rest of the fire.")
    } catch let printError as PrinterError {
        print("Printer error: \(printError)")
    } catch {
        print(error)
    }
}
testMultipleCatchError("Gutenberg")
testMultipleCatchError("Never Has Toner")
//忽略Error，不捕获
let pSuccess = try? sendToPrinter("Mergenthaler")
let pFailure = try? sendToPrinter("Never Has Toner")

//defer：1，执行顺序；2，作用域
var teaKettleHeating = false
func morningRoutine() {
    teaKettleHeating = true
    
    defer {
        teaKettleHeating = false
    }
    
    _ = try? sendToPrinter("Lanston")
    //Drink tea and read newspaper
    
}
//函数没有返回值时的错误提示
let mRoutine = morningRoutine()
print(teaKettleHeating)

//泛型
func repeatItem<Item>(item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
repeatItem("knock", numberOfTimes: 4)
repeatItem(2, numberOfTimes: 3)

//可以在函数，方法，以及类，结构体，枚举中使用泛型
enum OptionalValue<Wrapped> {
    case None
    case Some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .None
possibleInteger = .Some(100)
//不能改变变量类型
//possibleInteger: OptionalValue<String> = .None




var possibleString: OptionalValue<String> = .None
possibleString = .Some("Test")

//where
func anyCommonElements<T: SequenceType, U: SequenceType
    where T.Generator.Element: Equatable, T.Generator.Element == U.Generator.Element> (lhs: T, _ rhs: U) -> Bool {
        for lhsItem in lhs {
            for rhsItem in rhs {
                if lhsItem == rhsItem {
                    return true
                }
            }
        }
    return false
}
anyCommonElements([1,2,3], [3])
anyCommonElements([1,2,3], ["1","2"])
//where限制起作用
//anyCommonElements([1,2,3], [1:"1",2:"2"])










































