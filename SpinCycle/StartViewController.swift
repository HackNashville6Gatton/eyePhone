//
//  StartViewController.swift
//  SpinCycle
//
//  Created by Peter Kaminski on 11/8/14.
//  Copyright (c) 2014 WhiteSquirrelCoding. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {


    
    @IBOutlet weak var typeMachineLabel: UILabel!
    @IBOutlet weak var numberMachineLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var startButton: UIButton!
    
    //Variables to store null values until the VC is called and values are passed by preparesegue in WasherTableViewController
    var typeMachineString = ""
    var numberMachine = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set the seafoam green background.
        self.startButton.backgroundColor = UIColor(red: 145/255.0, green:218/255.0, blue:189/255.0, alpha:1.0)
        configureDatePicker()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func startTimer(sender: AnyObject) {
        
        var cal = NSCalendar.autoupdatingCurrentCalendar()
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "H:mm"
        
        let dateArray: [String] = findHourMinute(dateFormatter.stringFromDate(self.datePicker.date)) //Array to hold the information sent to the timer
        
        let hoursUsed = dateArray[0] //Hours of timer
        let minutesUsed = dateArray[1] //Minutes of timer
        
        
        let stringDate: String = dateFormatter.stringFromDate(NSDate()) //String date for the exact moment this is called
        
        let secondDateArray = findHourMinute(stringDate) //Now get the hours and minutes from the current time
        let currentHours = secondDateArray[0] //Hours of current
        let currentMinutes = secondDateArray[1] //Minutes of current time
        
        var endMinutes = (minutesUsed.toInt()! + currentMinutes.toInt()!) //Set the end minutes
        //let endMinute = (minutesUsed.toInt()! + currentMinutes.toInt()!) % 60
        
        var endHour = (hoursUsed.toInt()! + currentHours.toInt()!) //Set the end hours
        
        //If the number of minutes is greater than 60, then we have to add an extra hour to the hours place
        if endMinutes >  60{
            endHour =  endHour + 1
        }
        
        endMinutes = endMinutes % 60 //Now get the correct number of minutes using modulus
        endHour = endHour % 24 //Now get the correct number of hours using modulus
        
        //Find the current date. Laundry won't ever go over
        dateFormatter.dateFormat = "MM-dd-yyyy"
        let monthDayYear = dateFormatter.stringFromDate(NSDate())
        
        
        let endTime = String(format: "%@ %d:%d", arguments: [monthDayYear, endHour, endMinutes])//end time will be the time the timer is supposed to go off
        
        
        NSLog("%@ end time", endTime)
        
        dateFormatter.dateFormat = "MM-dd-yyyy H:mm"
        var dateFromString = dateFormatter.dateFromString(endTime) //Now create the date string for the end time of the machine.
        NSLog("%@  dateFromString", dateFromString!)
        NSLog("%@  stringFromDate", dateFormatter.stringFromDate(dateFromString!))
        
        
        var notification = UILocalNotification()
        notification.timeZone = NSTimeZone.defaultTimeZone()
        
        notification.fireDate = dateFromString
        notification.alertBody = "Your laundry is done!"
        UIApplication.sharedApplication().scheduleLocalNotification(notification)
    }
    
    func findHourMinute(formatDate: String) -> [String]{
        var retArray = [String]()
        
        retArray = formatDate.componentsSeparatedByString(":")
        
        return retArray
    }
    
    
    func configureDatePicker() {
        self.datePicker.datePickerMode = .CountDownTimer
        let date = NSDate()
        let cal = NSCalendar(calendarIdentifier: NSGregorianCalendar)
        let newDate = cal!.startOfDayForDate(date)
        self.datePicker.date = newDate
    }
    
}
