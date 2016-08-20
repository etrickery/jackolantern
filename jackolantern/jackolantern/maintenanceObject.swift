//
//  maintenanceObject.swift
//  jackolantern
//
//  Created by Eric Pfister on 8/18/16.
//  Copyright © 2016 com.etrickery. All rights reserved.
//

import UIKit

class maintenanceObject {
    
    
    var id: Int = Int()
    var engineCode :  String = String()
    var transmissionCode : String =  String()
    var intervalMileage : Int =  Int()
    var frequency :  Int = Int()
    var action :  String = String()
    var item :   String = String()
    var itemDescription :   String = String()
    var laborUnits :  Float = Float()
    var partUnits :  Float = Float()
    var driveType :   String = String()
    var modelYear :   String = String()
    var partCostPerUnit :  Float = Float()
    
    
    
    init(id: Int, engineCode :  String, transmissionCode : String, intervalMileage : Int, frequency :  Int, action :  String, item :   String, itemDescription :   String, laborUnits :  Float, partUnits :  Float, driveType :   String, modelYear :   String, partCostPerUnit :  Float){
    
    
    
    self.id = id
    self.engineCode = engineCode
    self.transmissionCode = transmissionCode
    self.intervalMileage = intervalMileage
    self.frequency = frequency
    self.action = action
    self.item = item
    self.itemDescription = itemDescription
    self.laborUnits = laborUnits
    self.partUnits = partUnits
    self.driveType = driveType
    self.modelYear = modelYear
    self.partCostPerUnit = partCostPerUnit
    
        
    }
    
    /*
     init(title : String, icon : String, details : String, image : String){
     self.title = title
     */
    
    
}
