//
//  FirstViewController.swift
//  Lista de tarefas
//
//  Created by Henrique Souza on 23/07/16.
//  Copyright © 2016 Henrique Souza. All rights reserved.
//

import UIKit

var todoList = [String]()

class FirstViewController: UIViewController, UITableViewDelegate {

    @IBOutlet var todoListTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard().object(forKey: "toDoList") != nil {
                todoList = UserDefaults.standard().object(forKey: "toDoList") as! [String]
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    } //Number of Lines
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        
        cell.textLabel?.text = todoList[indexPath.row]
        
        return cell
    } //Fill Table view
    
    
    
    func tableView(_ tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            
            todoList.remove(at: (indexPath as NSIndexPath).row)
            
            UserDefaults.standard().set(todoList, forKey: "toDoList")
            
            todoListTable.reloadData()
        }
    } //Capture Slide Button Style to Delete iten
    
    override func viewDidAppear(_ animated: Bool) {
        todoListTable.reloadData()
    } //Button Return of Keyboard
    
}

