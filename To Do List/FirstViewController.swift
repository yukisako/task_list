//
//  FirstViewController.swift
//  To Do List
//
//  Created by 迫 佑樹 on 2015/12/29.
//  Copyright © 2015年 迫 佑樹. All rights reserved.
//

import UIKit

var toDoList = [String]()

class FirstViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet var TaskTable: UITableView!
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        //Tableの数を返すので，後でTask配列の数を返すように変更
        //let TaskArray = NSUserDefaults.standardUserDefaults().objectForKey("TaskArray")!

        return toDoList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")

        
        cell.textLabel?.text = toDoList[indexPath.row]
        
        return cell
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if NSUserDefaults.standardUserDefaults().objectForKey("TaskArray") != nil{
            
            toDoList = NSUserDefaults.standardUserDefaults().objectForKey("TaskArray")! as! [String]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        //ユーザがテーブルの内容を編集した時に呼ばれる．
        
        //左にスワイプされたことのチェック
        if editingStyle == UITableViewCellEditingStyle.Delete {
            
            toDoList.removeAtIndex(indexPath.row)
            
            NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "TaskArray")
            
            TaskTable.reloadData()
    
        }
    }
    

    override func viewDidAppear(animated: Bool) {
        TaskTable.reloadData()
    }

}

