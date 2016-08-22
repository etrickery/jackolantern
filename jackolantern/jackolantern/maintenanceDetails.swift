//
//  maintenanceDetails.swift
//  jackolantern
//
//  Created by Eric Pfister on 8/21/16.
//  Copyright © 2016 com.etrickery. All rights reserved.
//

import UIKit

class maintenanceDetails : UIViewController {
    
    
    var listOfMaintenance : [String] = []

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var detailLabel: UILabel!
    
    @IBOutlet weak var detailText: UITextView!
    
    
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //self.titleLabel.text = "\(listOfMaintenance[1]) : \(listOfMaintenance[0])"
        //self.detailLabel.text = "\(listOfMaintenance[2])"
        
        //self.detailText.text = "\(listOfMaintenance[1]) : \(listOfMaintenance[0])"
    
    
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
