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
    var listOfMaintenance : [String] = []

    //outlet
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var detailText: UITextView!
    
    //viewdidload
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
