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
        
        let endHour = (hoursUsed.toInt()! + currentHours.toInt()!) % 24
        let endMinute = (minutesUsed.toInt()! + currentMinutes.toInt()!) % 60
        
        let endTime = String(format: "%d:%d", arguments: [endHour, endMinute])//end time will be the time the timer is supposed to go off
        
        
        NSLog("%@ end time", endTime)
        dateFormatter.dateFormat = "H:mm" //Change the formatter type
        var dateFromString = dateFormatter.dateFromString(endTime) //Now create the date string for the end time of the machine.
        NSLog("%@  dateFromString", dateFromString!)
        NSLog("%@  stringFromDate", dateFormatter.stringFromDate(dateFromString!))
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
