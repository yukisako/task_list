//
//  SecondViewController.swift
//  To Do List
//
//  Created by 迫 佑樹 on 2015/12/29.
//  Copyright © 2015年 迫 佑樹. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet var TaskField: UITextField!
    @IBAction func AddTaskButton(sender: AnyObject) {
        
        toDoList.append(TaskField.text!)
        
        TaskField.text = ""
        
        NSUserDefaults.standardUserDefaults().setObject(toDoList,
            forKey: "TaskArray")
        
        for x in toDoList{
            print(x)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //キーボード外を押した時にキーボードが閉じるように．
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //リターンキーを押した時にキーボードが閉じるように．
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        
        TaskField.resignFirstResponder()
        print("OK")
        return true
        
    }
    
    
}

