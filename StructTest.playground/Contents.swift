//: Playground - noun: a place where people can play

import UIKit

//計算屬性
struct Dollar {
    var dollar_US: Double
    
    var USconvNT: Double {
        get{
            return dollar_US * 31
        }
        set{
            dollar_US = newValue / 31
        }
    }
}

var item = Dollar(dollar_US: 100)
//get NT
item.USconvNT
//set NT, get US
item.USconvNT = 6200
item.dollar_US


struct Point {
    var x: Double, y: Double
}

struct Side {
    var length: Double = 0.0 {
        //加入屬性監控
        willSet {
            println("長度變更前\(length)")
        }
        didSet {
            println("長度變更後\(length)")
        }
    }
}

//class Side {
//    var length: Double
//    
//    init (length: Double){
//        self.length = length
//    }
//}

class Square {
    var originPoint: Point
    var xylenght: Side
    
    init (originPoint: Point, xylenght: Side) {
        self.originPoint = originPoint
        self.xylenght = xylenght
    }
    
    var centerPoint: Point {
        get {
            let centerPointX = originPoint.x + xylenght.length / 2
            let centerPointY = originPoint.y + xylenght.length / 2
            return Point(x: centerPointX, y: centerPointY)
        }
        set {
            originPoint.x = newValue.x - xylenght.length / 2
            originPoint.y = newValue.y - xylenght.length / 2
        }
    }
    
    class func lines() -> Int {
        return 4
    }
}

var square01 =  Square(originPoint: Point(x: 20, y: 30), xylenght: Side(length: 10))
square01.centerPoint

square01.centerPoint = Point(x: 25, y: 35)
square01.originPoint.x
square01.originPoint.y

//屬性監控變更
var square02 = Square(originPoint: Point(x: 1, y: 1), xylenght: Side(length: 10))
square02.xylenght.length = 20

//類別方法
Square.lines()






