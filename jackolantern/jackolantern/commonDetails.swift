//
//  commonDetails.swift
//  jackolantern
//
//  Created by Eric Pfister on 8/9/16.
//  Copyright © 2016 com.etrickery. All rights reserved.
//

import UIKit

class commonDetailsViewController: UIViewController {

    @IBOutlet weak var commonImageView: UIImageView!
    
    
    @IBOutlet weak var commonLabelView: UILabel!
    
    
    @IBOutlet weak var commonTextView: UITextView!
    
    
    
    
    
    
    var selectedCommon : commonTableData?
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let theCommon = selectedCommon {
            commonImageView.image = UIImage(named: theCommon.image)
            commonLabelView.text = theCommon.title
            commonTextView.text = theCommon.details
            
            
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}