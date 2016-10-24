//
//  ViewController.swift
//  MyHealthyBaby
//
//  Created by Daniel Gonzalez on 10/22/16.
//  Copyright © 2016 Daniel Gonzalez. All rights reserved.
//

import UIKit
import CoreData

class JournalViewController: UIViewController {

    @IBOutlet  var myDatePicker: UIDatePicker!
    
    @IBOutlet  var poopSwitch: UISwitch!
    @IBOutlet  var peeSwitch: UISwitch!
    
    @IBOutlet  var breastMilkSteeper: UIStepper!
    @IBOutlet  var breastMilkCounterLabel: UILabel!
    
    @IBOutlet  var bottleStepper: UIStepper!
    @IBOutlet  var bottleCounterLabel: UILabel!
 
    override func viewDidLoad() {
        super.viewDidLoad()

        breastMilkSteeper.wraps = true
        breastMilkSteeper.autorepeat = true
        breastMilkSteeper.maximumValue = 10
        
        bottleStepper.wraps = true
        bottleStepper.autorepeat = true
        bottleStepper.maximumValue = 10
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ShowMeDateTime(_ sender: AnyObject) {
        let date:Date = myDatePicker.date
        print("Date \(date)")
    }
    
    
    @IBAction func BreastMilkChanged(_ sender: UIStepper) {
        let breast = Int(sender.value).description
        breastMilkCounterLabel.text = String(breast)
        let date = myDatePicker.date
        print ("Date:\(date) breast:\(breast)")
    }
    
    @IBAction func BottleChanged(_ sender: UIStepper) {
        let bottle = Int(sender.value).description
        bottleCounterLabel.text = String(bottle)
        let date = myDatePicker.date
        print ("Date:\(date) bottle:\(bottle)")
    }
    
    // Insert user data into DB.
    @IBAction func SubmitBtnPressed(_ sender: AnyObject) {
 
        let context =  (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let poop = poopSwitch.isOn
        let pee = peeSwitch.isOn
 
        let date = myDatePicker.date

        let entityDescription = NSEntityDescription.entity(forEntityName: "Journal", in: context)
        let entry = Journal(entity: entityDescription!, insertInto: context)
        
       entry.date = date as NSDate?
       entry.poop = poop
       entry.pee = pee
       entry.breast = breastMilkSteeper.value
       entry.bottle = bottleStepper.value
    
        do {
             try context.save()
        } catch {
            print ("Problem inserting data")
        }
        
    }
    
    
}

