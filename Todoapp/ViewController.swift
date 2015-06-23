//
//  ViewController.swift
//  Todoapp
//
//  Created by Magnus Oplenskdal on 18/06/15.
//  Copyright © 2015 Magnus Oplenskdal. All rights reserved.
//
import WatchConnectivity
import UIKit

protocol NewTodoViewControllerDelegate {
    func didCreateTodo(todo: Todo)
}

class ViewController: UIViewController, NewTodoViewControllerDelegate, WCSessionDelegate{

    @IBOutlet weak var tableView: UITableView!
    var fakeData = [Todo]()
    var session:WCSession!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        session = WCSession.defaultSession()
        session.delegate = self
        session.activateSession()
        setDelegates()
        session.transferUserInfo(["test" : "hello"])
        //connectToWatch()
    }
    
    
}


extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func setDelegates(){
        tableView.delegate = self
        tableView.dataSource = self
        //session.delegate = self
    }
    
    func connectToWatch(){
        session.activateSession()
        session.transferUserInfo(["test" : "hello"])
    }
    
    func didCreateTodo(todo:Todo){
        if(checkTodo(todo)){
            fakeData.append(todo)
        }
        navigationController?.popViewControllerAnimated(true);
        tableView.reloadData()
        print("sender data fra telefon")
        session.transferUserInfo(["test" : "hello"])
    }
    
    func checkTodo(todo:Todo) ->Bool{
        for aTodo in fakeData{
            if(aTodo.id == todo.id){
                return false;
            }
        }
        return true;
    }
    //Handle session input
    func session(session: WCSession, didReceiveUserInfo userInfo: [String : AnyObject]) {
        print("fikk info fra klokke til telefon")
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("todoNormalCell") as! TodoViewCell
        let todo = fakeData[indexPath.row]
        cell.cellTitle?.text = todo.description
        return cell
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "createViewControllerTransition"{
            let destination = segue.destinationViewController as! CreateTodoViewController
            destination.vc = self
            if let todo = sender as? Todo {
                destination.editableTodo = todo
            }
        }
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            fakeData.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let todo = fakeData[indexPath.row]
        performSegueWithIdentifier("createViewControllerTransition", sender: todo)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fakeData.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
   
}