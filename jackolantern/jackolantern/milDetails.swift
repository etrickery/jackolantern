//
//  milDetails.swift
//  jackolantern
//
//  Created by Eric Pfister on 8/9/16.
//  Copyright © 2016 com.etrickery. All rights reserved.
//

import UIKit

class milDetailsViewController: UIViewController {
    
    
    var selectedMIL : milTableData?
    
    @IBOutlet weak var milImage: UIImageView!
    
    @IBOutlet weak var milTitle: UILabel!
    
    @IBOutlet weak var milInformation: UITextView!
    
    @IBOutlet weak var milIcon: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let theMIL = selectedMIL {
        
            milImage.image = UIImage(named: theMIL.image)
            milTitle.text = theMIL.title
            
            //disable scrolling to prevent text from scrolling to bottom of text box after filling with text
            milInformation.scrollEnabled = false
            milInformation.text = theMIL.details
            //reenable scrolling
            milInformation.scrollEnabled = true
            milIcon.image = UIImage(named: theMIL.icon)
    
        }
    
    
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

