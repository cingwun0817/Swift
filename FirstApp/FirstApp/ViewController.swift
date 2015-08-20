//
//  ViewController.swift
//  FirstApp
//
//  Created by  Leo on 2015/7/30.
//  Copyright (c) 2015年 Leo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let meCover = UIImage(named: "IMG_4756.jpg")
    let suCover = UIImage(named: "IMG_4767.jpg")
    let momCover = UIImage(named: "IMG_4788.jpg")
    let allCover = UIImage(named: "IMG_4792.jpg")
    let catCover = UIImage(named: "IMG_4756.jpg")
    
    
    @IBOutlet weak var Album: UILabel!
    @IBOutlet weak var Img: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Album.text = "Is Me"
        Img.image = meCover
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btn1(sender: AnyObject) {
        Album.text = "碗粥"
        Img.image = suCover
    }
    
    @IBAction func btn2(sender: AnyObject) {
        Album.text = "Mom"
        Img.image = momCover
    }
    @IBAction func test(sender: AnyObject) {
    }
    
    @IBAction func btn3(sender: AnyObject) {
        Album.text = "everybody"
        Img.image = allCover
    }
    
    @IBAction func btn4(sender: AnyObject) {
        Album.text = "Cat"
        Img.image = catCover
    }
}

