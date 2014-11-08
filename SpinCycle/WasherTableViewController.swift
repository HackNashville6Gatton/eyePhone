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


   

}
