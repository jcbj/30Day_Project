//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let b = 10
var a = 5
a = b

let (x,y) = (3,4)
print("(x,y) = (\(x),\(y))")

if x == y {
    //Error
}

let bb = "bb"
let cc = "cc"
let bbcc = bb + cc

var c = UInt8.max
c = c &+ 1
c = UInt8.max
//c += 1

9 % 4
9 % -4
-9 % 4
-9 % -4

8 % 2.5

var d = -1
var f = 1

-d
-f
+d
+f

//d = f += 2

1 == 1
1 != 2
1 < 2
2 > 1
1 <= 1
2 >= 2

1 === 2
1 === 1
1 !== 2
1 !== 1

//(1, "zebra") < (2, "apple")

let e = 10
let g = 15
let min = (e < g) ? e : g

var userColorName: String?
let color = userColorName ?? "Red"
let color1 = (userColorName != nil) ? userColorName : "Green"


for i in 0..<4 {
    print(i)
}
for i in 0...4 {
    print(i)
}

var h = 1
func GetValue() -> Int {
    h = 3
    return h
}

if h < 0 && GetValue() < 5 {
    h
}
h
if h > 0 || GetValue() < 5 {
    h
}
h















