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
        
        
        self.machines = [LaundryMachine(number: 1, typeOfMachine: LaundryMachine.Machine.Washer), LaundryMachine(number: 2, typeOfMachine: LaundryMachine.Machine.Washer),LaundryMachine(number: 3, typeOfMachine: LaundryMachine.Machine.Washer),LaundryMachine(number: 4, typeOfMachine: LaundryMachine.Machine.Washer),LaundryMachine(number: 5, typeOfMachine: LaundryMachine.Machine.Washer), LaundryMachine(number: 1, typeOfMachine: LaundryMachine.Machine.Dryer), LaundryMachine(number: 2, typeOfMachine: LaundryMachine.Machine.Dryer), LaundryMachine(number: 3, typeOfMachine: LaundryMachine.Machine.Dryer), LaundryMachine(number: 4, typeOfMachine: LaundryMachine.Machine.Dryer), LaundryMachine(number: 5, typeOfMachine: LaundryMachine.Machine.Dryer), LaundryMachine(number: 6, typeOfMachine: LaundryMachine.Machine.Dryer)]
        
        
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
        
        cell.textLabel.text = NSString(format: "%d", currentMachine.number) //Set the text of the cell
        
        
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator //This means that our cell has push action when pressed
        
        return cell //Return the created cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject]? {
        
        var watchAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Watch", handler:{action, indexpath in
                //Update the watch count
                self.machines[indexPath.row].watchCount = self.machines[indexPath.row].watchCount + 1
            
            });
        watchAction.backgroundColor = UIColor(red:0.35, green:0.84, blue:0.81, alpha:1.0)
        
        var moreInfoAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "More", handler:{action, indexpath in
                println("DELETE•ACTION");
            });
        moreInfoAction.backgroundColor = UIColor(red:0.95, green:0.60, blue:0.60, alpha:1.0)
        
        return [moreInfoAction, watchAction];
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
    }


   

}
