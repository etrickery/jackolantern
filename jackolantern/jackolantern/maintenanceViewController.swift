//
//  maintenanceViewController.swift
//  jackolantern
//
//  Created by Eric Pfister on 8/11/16.
//  Copyright © 2016 com.etrickery. All rights reserved.
//





import UIKit

class maintenanceViewController  : UIViewController {
    
    var currentVehicle : [String] = ["", "", "", "", ""]

    
    //Variables & Stuff
    //convert to calculated range if time permits
    
    
    
    
    
    
    
    //https://api.edmunds.com/v1/api/maintenance/actionrepository/findbymodelyearid?modelyearid=100537293&fmt=json&api_key=a69s88jdn9qtfdyufxr9mch9
    /*
    "String": 1878304,
    "engineCode": "4INAG2.4",
    "transmissionCode": "AUTOMATIC",
    "intervalMileage": 60000,
    "frequency": 4,
    "action": "Change",
    "item": "Automatic transmission fluid",
    "itemDescription": "The fluid used for lubricating and cooling an automatic transmission.",
    "laborUnits": 0.7,
    "partUnits": 1.0,
    "driveType": "ALL",
    "modelYear": "/api/vehicle/modelyearrepository/findbyid?id=100537293",
    "partCostPerUnit": 7.5
*/
    
    
    
    
    
    
    
    
    
    
    
    
    
    //View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        print("\(currentVehicle[0]) \(currentVehicle[1]) \(currentVehicle[2]) \(currentVehicle[3]) \(currentVehicle[4]) ")
       
    }
    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
