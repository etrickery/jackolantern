//
//  yearTableViewController.swift
//  jackolantern
//
//  Created by Eric Pfister on 8/15/16.
//  Copyright © 2016 com.etrickery. All rights reserved.
//

import UIKit

class yearTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //var parsable : [String : [String : [String : [String : Int]]]]
    
    
    var yearRange : [Int] = [1990, 1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998, 1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016]
    var makes : [String] = [String]()
    var models : [String] = [String]()
    
    
    var goAhead : Bool = false
    
    
    @IBOutlet weak var yearTableOutlet: UITableView!
    
    
    var someObject : [String : AnyObject] = [String : AnyObject]()
    
    //View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return yearRange.count
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell : yearTableViewCell = yearTableOutlet.dequeueReusableCellWithIdentifier("yearCell")! as! yearTableViewCell
        
        let currentYear : String = String(yearRange[indexPath.row])
        
        
        cell.yearLabel.text = currentYear
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let requestURL = NSURL(string: "https://api.edmunds.com/api/vehicle/v2/makes?state=used&year=\(yearRange[indexPath.row])&view=basic&fmt=json&api_key=a69s88jdn9qtfdyufxr9mch9")!
        
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
                    //get json object and pass it on as currentjsonobject [String : AnyObject]
                    let jsonObject = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
                    
                    self.someObject = jsonObject as! [String : AnyObject]
                    
                    
                    if let theObject = (jsonObject["makes"]){
                        let makeCount = theObject!.count
                        for q in 0...(makeCount-1){
                            if let makeOptions = theObject![q]["name"]{
                                self.makes.append(makeOptions! as! String)
                                
                            }
                        }
                        
                        
                        
                    }
                    self.goAhead = true
                    
                    dispatch_async(dispatch_get_main_queue(),{
                        self.performSegueWithIdentifier("yearToMakeSegue", sender: indexPath)
                    })
                    
                }catch let error {
                    //print error if it occurs
                    print("Error: \(error)")
                }
            }
            
        }
        
        task.resume()
        
    }
    
    
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "yearToMakeSegue" {
            
            return goAhead
            
        }
        return false
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //print(someObject["makes"]![0]["models"]!![0]["name"])
        
        let indexPath : NSIndexPath? = yearTableOutlet.indexPathForSelectedRow
        
        //makes[?]
        let makeSelect = segue.destinationViewController as! makeTableViewController
        
        for x in 0...(someObject["makes"]!.count-1){
            
            if String(someObject["makes"]![x]["name"]) == String(makes[x]){
                for y in 0...(someObject["makes"]![x]["models"]!!.count-1){
                    
                    
                    print(someObject["makes"]![x]["models"]!![y]["name"])
                    
                    
                }
            }
        }
        
        
        makeSelect.makes = self.makes
        makeSelect.jsonObject = self.someObject
        makeSelect.currentVehicle[0] = String(self.yearRange[indexPath!.row])
        makeSelect.currentVehicle[1] = String(self.makes[indexPath!.row])
        makeSelect.models = self.models
        //print(models)
        
        
    }
    
}
