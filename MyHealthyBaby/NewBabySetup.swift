//
//  NewBabySetup.swift
//  MyHealthyBaby
//
//  Created by Vijay Kokatnur on 10/23/16.
//

import UIKit
import CoreData
import Foundation

class NewBabySetup: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    var birthdayPicker = UIDatePicker()
    var genderPicker = UIPickerView()
    
    @IBOutlet  var genderTextField: UITextField!
    @IBOutlet  var birthdayTextField: UITextField!

    var genderData: [String] = [String]()

    var selectedGender:String?
    
    @IBOutlet  var fname: UITextField!
    @IBOutlet  var lname: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        genderData = ["Girl", "Boy"]

        self.genderPicker.delegate = self
        self.genderPicker.dataSource = self
        
        self.genderPicker.isHidden = true
        self.birthdayPicker.isHidden = true

        self.genderTextField.inputView = self.genderPicker
        self.birthdayTextField.inputView = self.birthdayPicker
        
        self.birthdayPicker.addTarget(self, action: #selector(self.birthdateChanged), for: UIControlEvents.valueChanged)


    }
    
     func birthdateChanged(sender: UIDatePicker){
        print("here")
         self.birthdayPicker.isHidden = false
        let timeFormatter = DateFormatter()
        let strDate = timeFormatter.string(from:birthdayPicker.date)
        self.birthdayTextField.text = strDate

    }

    @IBAction func genderSelectionClicker(_sender : AnyObject){
        self.birthdayPicker.isHidden = true
        self.genderPicker.isHidden = false;
    }
    
    @IBAction func birthdaySelectionClicker(_sender : AnyObject){
        print("here 2")
        self.genderPicker.isHidden = true
        self.birthdayPicker.isHidden = false;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genderData.count

    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.genderTextField.text = genderData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genderData[row]
    }
    
    @IBAction func saveBabyInformation(_ sender: AnyObject) {
        let context =  (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let entityDescription = NSEntityDescription.entity(forEntityName: "Journal", in: context)
        let baby = Baby(entity: entityDescription!, insertInto: context)

        baby.birthday = birthdayPicker.date as NSDate?
        baby.isMale = (selectedGender == "Boy")
        baby.fname = fname.text
        baby.lname = lname.text
        
        do {
            try context.save()
        } catch {
            print ("Problem inserting data")
        }
    }
}
