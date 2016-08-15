//
//  maintenanceViewController.swift
//  jackolantern
//
//  Created by Eric Pfister on 8/11/16.
//  Copyright © 2016 com.etrickery. All rights reserved.
//

import UIKit

class maintenanceViewController  : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate{
    
    //Variables & Stuff
    //convert to calculated range if time permits
    var yearRange : [Int] = [1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016]
    //string holding address of api call so it can be used by various api calls
    var makeAPI : String?
    //a temporary json storage variable
    var currentJSONObject : NSDictionary = NSDictionary(){
        didSet {
            
            print(currentJSONObject)
            
        }
    }
    //contains details about vehicle
    var selectedVehicle : [String] = ["", "", "", ""]
    //which question are we at
    var currentStatus : Int = 0
    //selected row (currently - stored)
    var currentRowSelected : Int?
    
    
    //directions label values
    enum directions : String {
        case year = "Select Vehicle Year:"
        case make = "Select Vehicle Make:"
        case model = "Select Vehicle Model:"
        case mileage = "Enter Current Vehicle Mileage:"
    }
    
    //load api
    func loadAPI(getThisURL : String){
        //url passed in
        //address to get
        let requestURL = NSURL(string: getThisURL)!
        //setup request
        let urlRequest = NSMutableURLRequest(URL: requestURL)
        //create session
        let session = NSURLSession.sharedSession()
        //build task
        let task = session.dataTaskWithRequest(urlRequest) {
            (data, response, error) in
            //variable to contain response
            let httpResponse = response as! NSHTTPURLResponse
            //store status code
            let statusCode = httpResponse.statusCode
            //check for success, else - error codes
            if (statusCode == 200) {
                do{
                    //get json object and pass it on as currentjsonobject NSDictionary
                    let jsonObject = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
                    self.currentJSONObject = jsonObject as! NSDictionary
                    
                    
                }catch let error {
                    //print error if it occurs
                    print("Error: \(error)")
                }
            }
            
        }
        
        task.resume()
        
    }
    
    
    
    
    
    //Outlets & Actions
    //back button that lets you retreat through vehicle selection if neccesary.
    @IBOutlet weak var backButtonOutlet: UIButton!
    //activated back button
    @IBAction func backButtonAction(sender: UIButton) {
        switch currentStatus {
        case 0:
            //backButtonOutlet, directionLabel, pickerView, mileageBox, okButtonOutlet, currentStatus
            //makeAPI, selectedVehicle
            print("")
        case 1:
            print("")
        case 2:
            print("")
        case 3:
            print("")
        default:
            print("okbutton returned default")
        }
        
    }
    
    //instructional label
    @IBOutlet weak var directionLabel: UILabel!
    
    //picker
    @IBOutlet weak var pickerView: UIPickerView!
    
    //mileage box
    @IBOutlet weak var mileageBox: UITextField! = nil
    
    //ok button
    @IBOutlet weak var okButtonOutlet: UIButton!
    //ok activated
    @IBAction func okButtonAction(sender: UIButton) {
        
        //enable ok button & return color to it
        self.okButtonOutlet.enabled = false
        self.okButtonOutlet.backgroundColor = UIColor.darkGrayColor()
        
        //figure out which state user is currently in, and reacte accordingly
        switch currentStatus {
        case 0: //VEHICLE YEAR
            
            //make UI changes and update variables
            self.backButtonOutlet.hidden = false
            self.directionLabel.text = directions.make.rawValue
            self.selectedVehicle[0] = String(self.pickerView.selectedRowInComponent(0))
            self.currentStatus = 1
            
            //get api data
            if let whichRow = self.currentRowSelected{
                self.makeAPI = "https://api.edmunds.com/api/vehicle/v2/makes?state=used&year=\(yearRange[whichRow])&view=basic&fmt=json&api_key=a69s88jdn9qtfdyufxr9mch9"
                self.loadAPI(makeAPI!)
            }

            //refresh pickerview
            self.pickerView.reloadAllComponents()
            
        case 1:
            print("")
        case 2:
            print("")
        case 3:
            print("")
        default:
            print("okbutton returned default")
        }
        
    }
    
    //Text View Stuff
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        mileageBox.resignFirstResponder()
        return true
    }
    
    
    //View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //update UI elements and variables
        self.okButtonOutlet.enabled = false
        self.okButtonOutlet.backgroundColor = UIColor.darkGrayColor()
        self.mileageBox.delegate = self
        self.backButtonOutlet.hidden = true
        self.directionLabel.text = directions.year.rawValue
        self.mileageBox.hidden = true
    }
    
    
    
    //number of columns in pickerviews
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //Numbers of Components
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //backButtonOutlet, directionLabel, pickerView, mileageBox, okButtonOutlet, currentStatus
        //makeAPI, selectedVehicle
        switch currentStatus {
        case 0:
            return yearRange.count
        case 1:
            
            return 1
        case 2:
            return 1
        case 3:
            return 1
        default:
            print("Picker View 'number of rows in component' returned default")
            return 0
        }
        
        
        
    }
    
    //Row Title
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //backButtonOutlet, directionLabel, pickerView, mileageBox, okButtonOutlet, currentStatus
        //makeAPI, selectedVehicle
        switch currentStatus {
        case 0:
            return String(self.yearRange[row])
        case 1:
            return ""
        case 2:
            return ""
        case 3:
            return ""
        default:
            print("Picker View 'title for row' returned default")
            return ""
        }
        
    }
    
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //backButtonOutlet, directionLabel, pickerView, mileageBox, okButtonOutlet, currentStatus
        //makeAPI, selectedVehicle
        
        
        self.currentRowSelected = row
        if (self.currentRowSelected != nil) {
            self.okButtonOutlet.enabled = true
            self.okButtonOutlet.backgroundColor = UIColor(red:0.00, green:0.44, blue:0.74, alpha:1.0)
        }
        
        
    }
    
    
    
    
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "maintenanceToDetailSegue" {
            if currentStatus == 4 {
                return true
            }
        }
        return false
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("segue happened")
    }
    
    
    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
