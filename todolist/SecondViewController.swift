//
//  SecondViewController.swift
//  todolist
//
//  Created by Aaron Williamson on 11/12/14.
//  Copyright (c) 2014 Aaron Williamson. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var toDoItem: UITextField!
    
    
    @IBAction func addItem(sender: AnyObject) {
    
        toDoItems.append(toDoItem.text)
        let immutableToDoItems = toDoItems
        NSUserDefaults.standardUserDefaults().setObject(immutableToDoItems, forKey: "toDoItems")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        toDoItem.text = ""
        
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    }

}

