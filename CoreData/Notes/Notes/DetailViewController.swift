//
//  DetailViewController.swift
//  Notes
//
//  Created by  Leo on 2015/8/12.
//  Copyright (c) 2015年 Leo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var lableText: UILabel!
    
    var detailItem : AnyObject?
    
    override func viewDidAppear(animated: Bool) {
        if let detail:AnyObject = self.detailItem{
            lableText.text = detail.description
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
