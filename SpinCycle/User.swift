//
//  User.swift
//  SpinCycle
//
//  Created by Peter Kaminski on 11/9/14.
//  Copyright (c) 2014 WhiteSquirrelCoding. All rights reserved.
//

import Foundation

class User: NSObject {
    
    var idNum: NSUUID //User has an id number that will be specific to each user--this is specific for vendors only
    var watching: [LaundryMachine] //Array of all the machines a user is watching
    
    var using: [LaundryMachine]
    
    //Init the user class
    init(idNum: NSUUID){
        self.watching = [LaundryMachine(number: 1, typeOfMachine: LaundryMachine.Machine.Dryer)] //hard code this for now. Later this will be information we retrieve from the server
        self.using = [LaundryMachine(number: 6, typeOfMachine: LaundryMachine.Machine.Washer)] //hard code this
        self.idNum = idNum
    }
    
    //We will write this method to find the user's information from a server
    func retrieveUserInfo(){
        
    }
    
    //Method to add a watched machine
    func userWatch(machineToWatch: LaundryMachine){
        self.watching.append(machineToWatch)
    }
    
}