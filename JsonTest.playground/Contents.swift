//: Playground - noun: a place where people can play

import UIKit

var url = NSURL(string: "http://opendata.epa.gov.tw/ws/Data/AQX/?format=json")

var data = NSData(contentsOfURL: url!, options: NSDataReadingOptions.DataReadingUncached, error: nil)

var json: AnyObject! = NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments, error: nil)

for res in json as! NSArray {
    var siteName = res.objectForKey("SiteName") as! NSString
    var status = res.objectForKey("Status") as! NSString
    
    println("地點：\(siteName)\n空氣品質：\(status)\n")
}
