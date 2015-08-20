//: Playground - noun: a place where people can play

import UIKit

for index in 1...5{
    println(index)
}

for _ in 1...5{
    println("hello")
}

var total = 0
for i in 1...10{
    total += i
}
println(total)

var myScore = 65
if myScore < 60 {
    println("不及格")
} else if myScore>=60 && myScore<70 {
    println("低空飛過")
} else {
    println("高分群")
}

var group = "D"
switch group{
    case "A":
        println("A級分")
    case "B":
        println("B級分")
    case "C":
        println("C級分")
    default:
        println("none")
}
