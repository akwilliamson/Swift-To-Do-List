//
//  FirstViewController.swift
//  todolist
//
//  Created by Aaron Williamson on 11/12/14.
//  Copyright (c) 2014 Aaron Williamson. All rights reserved.
//

import UIKit

var toDoItems:[String] = []

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tasksTable:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoItems.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        cell.textLabel.text = toDoItems[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            toDoItems.removeAtIndex(indexPath.row)
            
            let immutableToDoItems = toDoItems
            NSUserDefaults.standardUserDefaults().setObject(immutableToDoItems, forKey: "toDoItems")
            NSUserDefaults.standardUserDefaults().synchronize()
            
            tasksTable.reloadData()
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        if var storedToDoItems : AnyObject = NSUserDefaults.standardUserDefaults().objectForKey("toDoItems") {
        
            toDoItems = []
            
            for var i = 0; i < storedToDoItems.count; ++i {
                toDoItems.append(storedToDoItems[i] as NSString)
            }
        
        }
        
        tasksTable.reloadData()
    }
    
}

