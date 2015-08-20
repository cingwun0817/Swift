//
//  NotesTableViewController.swift
//  Notes
//
//  Created by  Leo on 2015/8/12.
//  Copyright (c) 2015年 Leo. All rights reserved.
//

import UIKit
import CoreData

class NotesTableViewController: UITableViewController {

    var notes = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "Notes")
        
        var error : NSError?
        let fetchedRes = managedContext?.executeFetchRequest(fetchRequest, error: &error) as! [NSManagedObject]?
        
        if let res = fetchedRes {
            notes = res
        } else {
            println(error)
        }
        
        self.tableView.reloadData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
    }
    
    @IBAction func addBtn(sender: AnyObject) {
        let alertController = UIAlertController(title: "加入記事本", message: "請輸入標題", preferredStyle: UIAlertControllerStyle.Alert)
        
        alertController.addTextFieldWithConfigurationHandler { (text : UITextField!) -> Void in
            
        }
        
        alertController.addAction(UIAlertAction(title: "新增", style:  UIAlertActionStyle.Default, handler: {
            (action: UIAlertAction!) ->Void in
            let textField = alertController.textFields![0] as! UITextField
            self.saveNotes(textField.text)
            self.tableView.reloadData()
        }))
        
        alertController.addAction(UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }

    func saveNotes(note: String) {
        //use CodeData necessary parameters (appDelegate, managedContext)
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        //set entity
        let entity = NSEntityDescription.entityForName("Notes", inManagedObjectContext: managedContext!)
        let title = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
        
        //save coreData
        title.setValue(note, forKey: "title")
        
        //pression error
        var error : NSError?
        if (managedContext?.save(&error) == nil) {
            println(error)
        }
        //save locaction data
        notes.append(title)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return notes.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell

        cell.textLabel!.text = notes[indexPath.row].valueForKey("title") as! String?
 
        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let managedContext = appDelegate.managedObjectContext
            
            //delete code data
            managedContext?.deleteObject(notes[indexPath.row] as NSManagedObject)
            //delete locaction
            notes.removeAtIndex(indexPath.row)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
            var error : NSError?
            if (managedContext?.save(&error) == nil) {
                println(error)
            }
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow(){
                let note = notes[indexPath.row].valueForKey("title") as! String
                
                (segue.destinationViewController as! DetailViewController).detailItem = note
            }
        }
    }
    

}
