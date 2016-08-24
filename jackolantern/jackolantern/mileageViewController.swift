//
//  mileageViewController.swift
//  jackolantern
//
//  Created by Eric Pfister on 8/15/16.
//  Copyright © 2016 com.etrickery. All rights reserved.
//

import UIKit

class mileageViewController: UIViewController, UITextFieldDelegate {
    
    //var
    var currentVehicle : [String] = ["", "", "", "", ""]
    var models : [String] = [String]()
    var yearID : [String] = [String]()
    var jsonObject : AnyObject?  = AnyObject?()
    
    //status
    var goAhead : Bool = false
    
    //outlets
    @IBOutlet weak var mileageTextField: UITextField!
    @IBOutlet weak var mileageOkButtonOutlet: UIButton!
    @IBAction func mileageOkButtonAction(sender: UIButton) {
        //ensure something was returned
        if let miles = self.mileageTextField.text{
            self.currentVehicle[4] = miles
            /*self.goAhead = true
             dispatch_async(dispatch_get_main_queue(),{
             })*/
            self.performSegueWithIdentifier("mileageToMaintenanceSegue", sender: sender)
        }
    }
    @IBAction func mileageValueIsThere(sender: UITextField) {
        //button toggle
        if self.mileageTextField.text != nil {
            self.mileageOkButtonOutlet.enabled = true
            self.mileageOkButtonOutlet.backgroundColor = UIColor(red:0.00, green:0.44, blue:0.74, alpha:1.0)
        }else{
            self.mileageOkButtonOutlet.enabled = false
            self.mileageOkButtonOutlet.backgroundColor = UIColor.darkGrayColor()
        }
    }
    
    //view did load
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        /*wipe variables
        self.currentVehicle.removeAll()
        self.models.removeAll()
        self.yearID.removeAll()
        self.jsonObject.removeAllObjects()
        */
        //setting changes
        self.mileageOkButtonOutlet.enabled = false
        self.mileageOkButtonOutlet.backgroundColor = UIColor.darkGrayColor()
        self.mileageTextField.delegate = self
        self.mileageTextField.keyboardType = UIKeyboardType.NumberPad
        self.mileageTextField.becomeFirstResponder()
    }
    
    
    
    //ensure numbers are entered
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool{
        //set up
        let numberChars = NSCharacterSet.init(charactersInString: "0123456789")
        let textFieldValue = NSCharacterSet.init(charactersInString: string)
        let okString = numberChars.isSupersetOfSet(textFieldValue)
        //return
        return okString
    }
    
    
    
    
    
    //segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let maintenanceScreen = segue.destinationViewController as! maintenanceViewController
        //pass
        maintenanceScreen.currentVehicle = self.currentVehicle
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
