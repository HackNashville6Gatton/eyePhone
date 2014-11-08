//
//  LaundryMachine.swift
//  SpinCycle
//
//  Created by Peter Kaminski on 11/8/14.
//  Copyright (c) 2014 WhiteSquirrelCoding. All rights reserved.
//

import Foundation

class LaundryMachine: NSObject {
    
    //class variables
    var number: Int //Number of the machine
    var timeRemaining: Double //Time remaining for that particular machine's cycle
    var watchCount: Int //How many people are currently attempting to use this machine
    var typeMachine: Machine  //Is the machine a washer of a dryer? We will use 0 for washer, 1 for dryer
    var inUse: Bool //Is it being used?
    
    //Constructor takes the number of the machine
    init(number: Int, typeOfMachine: Machine){
        
        self.number = number
        self.timeRemaining = 0
        self.watchCount = 0
        self.inUse = false
        self.typeMachine = typeOfMachine
        
        
    }
    
    //Starts the machine.
    func start(cycleTime: Double){
        self.timeRemaining = cycleTime
        self.inUse = true
        
    }
    
    
    //Enum to determine what type of machine we are using
    enum Machine : String{
        case Washer = "Washer"
        case Dryer = "Dryer"
    }
    
    
    
}
