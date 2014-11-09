//
//  WasherTableViewController.swift
//  SpinCycle
//
//  Created by Peter Kaminski on 11/8/14.
//  Copyright (c) 2014 WhiteSquirrelCoding. All rights reserved.
//

import UIKit

class WasherTableViewController: UITableViewController {
    
    //Array of the laundry machines
    var machines = [LaundryMachine]()
    var watchCount = 0 //Keep track of the watchers
    var type :String = "" //And the type
    var number: Int = 0 //And the number
    var status: Bool = true //And the status
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.addTarget(self, action: Selector("refreshInvoked"), forControlEvents: UIControlEvents.ValueChanged)
        refresh()
        
        var first = LaundryMachine(number: 1, typeOfMachine: LaundryMachine.Machine.Washer)
        first.inUse = false
        var second = LaundryMachine(number: 2, typeOfMachine: LaundryMachine.Machine.Washer)
        second.inUse = true
        
        self.machines = [first, second,LaundryMachine(number: 3, typeOfMachine: LaundryMachine.Machine.Washer),LaundryMachine(number: 4, typeOfMachine: LaundryMachine.Machine.Washer),LaundryMachine(number: 5, typeOfMachine: LaundryMachine.Machine.Washer), LaundryMachine(number: 1, typeOfMachine: LaundryMachine.Machine.Dryer), LaundryMachine(number: 2, typeOfMachine: LaundryMachine.Machine.Dryer), LaundryMachine(number: 3, typeOfMachine: LaundryMachine.Machine.Dryer), LaundryMachine(number: 4, typeOfMachine: LaundryMachine.Machine.Dryer), LaundryMachine(number: 5, typeOfMachine: LaundryMachine.Machine.Dryer), LaundryMachine(number: 6, typeOfMachine: LaundryMachine.Machine.Dryer)]
        
        
        self.tableView.reloadData() //Reload the
       
    }
    
    //Mark - refresh
    func refreshInvoked() {
        refresh(viaPullToRefresh: true)
    }
    
    func refresh(viaPullToRefresh: Bool = false) {
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
    }


    //TableView protocol methods that must be implemented

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return self.machines.count
    }

    //This method creates the content that goes in to each cell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("machineCell", forIndexPath: indexPath) as UITableViewCell //Create a cell using our reuse identifier
        
        let currentMachine = self.machines[indexPath.row] //Our currentMachine will be the indexPath.row
        
        cell.textLabel.text = NSString(format: "%@: %d", currentMachine.typeMachine.rawValue, currentMachine.number) //Set the text of the cell
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        
//        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator //This means that our cell has push action when pressed
        
        //Set the status of the machine
        if !self.machines[indexPath.row].inUse {
            cell.detailTextLabel!.text = "Open"
        }
            
        else{
            cell.detailTextLabel!.text = NSString(format: "%f", self.machines[indexPath.row].timeRemaining)
            cell.detailTextLabel!.textColor = UIColor.redColor()
        }
        
        return cell //Return the created cell
    }


    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    //Override, do nothing
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    //Create the actions for the slide
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject]? {
        
        if(self.machines[indexPath.row].inUse){
            var watchAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: NSString(format: "Watch(%d)", self.machines[indexPath.row].watchCount), handler:{action, indexpath in
                
                //Store all the information regarding the current machine being looked at
                let machine = self.machines[indexPath.row]
                let type = machine.typeMachine.rawValue
                let num = machine.number
                let description = String(format: "Now watching %@ %d", type, num)
                //Update the watch count
                self.machines[indexPath.row].watchCount = self.machines[indexPath.row].watchCount + 1
                
                //Reload the data
                self.tableView.reloadData()
                
                //Let user know they are watching the machine--I am hoping to change this to where we don't need to show an alert, it would automatically reload the information
                var toast = UIAlertView(title: "Watching", message: description, delegate: self, cancelButtonTitle: "Ok")
                toast.show()
            });
            
//            watchAction.backgroundColor = UIColor(red:0.35, green:0.84, blue:0.81, alpha:1.0)
            watchAction.backgroundColor = UIColor(red: 24/255.0, green:116/255.0, blue:205/255.0, alpha:1.0)
            
            return [watchAction];
        }
        
        else{
            var startAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Start", handler:{action, indexpath in
                //Update the watch count
                //self.machines[indexPath.row].inUse = true
                self.performSegueWithIdentifier("startMachine", sender: self)
                
            });
            
            startAction.backgroundColor = UIColor(red:0.12, green:0.86, blue:0.12, alpha:1.0)
            
            
            return [startAction];

        }
        
    }
    
    
    //This allows us to prepare to send information to the new view controller.
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        if segue.identifier == "startMachine" {
            let startViewController = segue.destinationViewController as StartViewController
            
        }
        
    }


   

}
