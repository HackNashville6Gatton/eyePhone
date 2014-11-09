//
//  StartViewController.swift
//  SpinCycle
//
//  Created by Peter Kaminski on 11/8/14.
//  Copyright (c) 2014 WhiteSquirrelCoding. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        dateFormatter.dateFormat = "h:mm a"
        
        NSLog("%@", dateFormatter.stringFromDate(self.datePicker.date))
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func configureDatePicker() {
        self.datePicker.datePickerMode = .CountDownTimer
        let date = NSDate()
        let cal = NSCalendar(calendarIdentifier: NSGregorianCalendar)
        let newDate = cal!.startOfDayForDate(date)
        self.datePicker.date = newDate
    }
    
}
