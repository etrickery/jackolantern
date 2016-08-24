//
//  maintenanceDetails.swift
//  jackolantern
//
//  Created by Eric Pfister on 8/21/16.
//  Copyright © 2016 com.etrickery. All rights reserved.
//

import UIKit

class maintenanceDetails : UIViewController {
    
    //var
    var listOfMaintenance : maintDetailObject = maintDetailObject()
    var test : String = ""
    
    
    
    //outlet
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var detailText: UITextView!
    
    //viewdidload
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("test: \(test)")
        if let theItem = listOfMaintenance.item{
            if let theAction = listOfMaintenance.action{
                self.titleLabel.text = "\(theItem) : \(theAction)"
            }
        }
        if let theMileage = listOfMaintenance.mileage{
            if theMileage == 0{
                self.detailLabel.text = "Every service visit"
            }else{
                self.detailLabel.text = "\(String(theMileage)) mile service"
            }
        }
        if let theDescription = listOfMaintenance.description{

        self.detailText.text = theDescription
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
