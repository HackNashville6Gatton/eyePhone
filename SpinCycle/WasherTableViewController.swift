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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var first = LaundryMachine(number: 1, typeOfMachine: LaundryMachine.Machine.Washer)
        first.inUse = false
        var second = LaundryMachine(number: 2, typeOfMachine: LaundryMachine.Machine.Washer)
        second.inUse = true
        
        self.machines = [first, second,LaundryMachine(number: 3, typeOfMachine: LaundryMachine.Machine.Washer),LaundryMachine(number: 4, typeOfMachine: LaundryMachine.Machine.Washer),LaundryMachine(number: 5, typeOfMachine: LaundryMachine.Machine.Washer), LaundryMachine(number: 1, typeOfMachine: LaundryMachine.Machine.Dryer), LaundryMachine(number: 2, typeOfMachine: LaundryMachine.Machine.Dryer), LaundryMachine(number: 3, typeOfMachine: LaundryMachine.Machine.Dryer), LaundryMachine(number: 4, typeOfMachine: LaundryMachine.Machine.Dryer), LaundryMachine(number: 5, typeOfMachine: LaundryMachine.Machine.Dryer), LaundryMachine(number: 6, typeOfMachine: LaundryMachine.Machine.Dryer)]
        
        
        self.tableView.reloadData() //Reload the
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        
        
        
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator //This means that our cell has push action when pressed
        
        //Set the status of the machine
        if !self.machines[indexPath.row].inUse {
            cell.detailTextLabel!.text = "Open"
        }
        else{
            cell.detailTextLabel!.text = NSString(format: "%f", self.machines[indexPath.row].timeRemaining)
            cell.detailTextLabel!.textColor = UIColor.redColor()
        }
       // cell.imageView.image = UIImage(
        
        return cell //Return the created cell
    }
    
    //We have to override this method to make sure our application can connect to multiple ViewControllers
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.performSegueWithIdentifier("washerInfo", sender: self)
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
                //Update the watch count
                self.machines[indexPath.row].watchCount = self.machines[indexPath.row].watchCount + 1
                
                //self.tableView.reloadData()
                //self.performSegueWithIdentifier("startMachine", sender: self)
            });
            
            watchAction.backgroundColor = UIColor(red:0.35, green:0.84, blue:0.81, alpha:1.0)
            
            
            return [watchAction];
        }
        
        else{
            var startAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Start", handler:{action, indexpath in
                //Update the watch count
                self.machines[indexPath.row].inUse = true
                self.performSegueWithIdentifier("startMachine", sender: self)
                
            });
            
            startAction.backgroundColor = UIColor(red:0.12, green:0.86, blue:0.12, alpha:1.0)
            
            
            return [startAction];

        }
        
    }
    
    
//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        NSLog("Type: %@  Number:%d", self.machines[indexPath.row].typeMachine.rawValue, self.machines[indexPath.row].number)
//    }
    
//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        self.performSegueWithIdentifier("washerInfo", sender: tableView)
//    }
    
    //This allows us to prepare to send information to the new view controller.
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "washerInfo" {
            let washerDetailViewController = segue.destinationViewController as UIViewController
            
        }
        
        if segue.identifier == "startMachine" {
            let startViewController = segue.destinationViewController as UIViewController
        }
        
    }


   

}
