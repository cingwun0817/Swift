//: Playground - noun: a place where people can play

import UIKit

//func
func send(){
    println("Hello")
}
send()

func sendHello(name: String){
    println("Hello \(name)!")
}
sendHello("Leo")

func sum(num1: Int, num2: Int)->Int{
    return num1 + num2
}
println(sum(2, 20))
println(sum(10, 40))

//class
class people {
    var wight: Double
    var hieght: Double
    var name: String
    var age: Int
    
    init(wight: Double, hieght: Double, name: String, age: Int){
        self.wight = wight
        self.hieght = hieght
        self.name = name
        self.age = age
    }
    
    func greeting(){
        println("Hello \(self.name). You are age \(self.age) old, wight \(self.wight), hieght \(self.hieght).")
    }
}

var Leo = people(wight: 84, hieght: 185, name: "Leo Wang", age: 23)
Leo.greeting()