//
//  ViewController.swift
//  ShowAlertView
//
//  Created by  Leo on 2015/8/11.
//  Copyright (c) 2015年 Leo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func showAlert(sender: AnyObject) {
        let alertController = UIAlertController(title: "地點通知", message: "到家了", preferredStyle:  UIAlertControllerStyle.Alert)
        //Alert 中間 ActionSheet 下方
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Destructive, handler: nil))
        
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        
        alertController.addTextFieldWithConfigurationHandler { (testField : UITextField!) -> Void in}
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
}

