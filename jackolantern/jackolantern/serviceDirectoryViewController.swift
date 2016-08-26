//
//  serviceDirectoryViewController.swift
//  jackolantern
//
//  Created by Eric Pfister on 8/24/16.
//  Copyright © 2016 com.etrickery. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit



class serviceDirectoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {
    
    
    let locationManager = CLLocationManager()
    
    let typeOfSearch : [String] = ["Window Tinting", "Automotive Detailing", "Automotive Accessories", "Wheels and Tires", "Bodyshop"]
    //searchingObjectifier
    
    var whichTable : Int = 0
    var tintShops : [theServiceObject] = [theServiceObject]()
    var detaShops : [theServiceObject] = [theServiceObject]()
    var acceShops : [theServiceObject] = [theServiceObject]()
    var wheeShops : [theServiceObject] = [theServiceObject]()
    var bodyShops : [theServiceObject] = [theServiceObject]()
    
    
    @IBOutlet weak var windowTintingOutlet: UIButton!
    @IBAction func windowTinting(sender: UIButton) {
        
        self.whichTable = 0
        dispatch_async(dispatch_get_main_queue(),{
            self.servDirTable.reloadData()
        })
        
    }
    
    
    
    @IBOutlet weak var detailingOutlet: UIButton!
    @IBAction func detailingAction(sender: UIButton) {
        self.whichTable = 1
        dispatch_async(dispatch_get_main_queue(),{
            self.servDirTable.reloadData()
        })
    }
    
    
    
    @IBOutlet weak var accessoriesOutlet: UIButton!
    @IBAction func accessoriesAction(sender: UIButton) {
        self.whichTable = 2
        dispatch_async(dispatch_get_main_queue(),{
            self.servDirTable.reloadData()
        })
    }
    
    
    
    
    @IBOutlet weak var wheelsTiresOutlet: UIButton!
    @IBAction func wheelsTiresAction(sender: UIButton) {
        self.whichTable = 3
        dispatch_async(dispatch_get_main_queue(),{
            self.servDirTable.reloadData()
        })
    }
    
    
    
    
    @IBOutlet weak var bodyshopOutlet: UIButton!
    @IBAction func bodyshopAction(sender: UIButton) {
        self.whichTable = 4
        dispatch_async(dispatch_get_main_queue(),{
            self.servDirTable.reloadData()
        })
    }
    
    
    
    
    
    
    
    @IBOutlet weak var servDirTable: UITableView!
    
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        //variables
        let userLocation:CLLocation = locations[0]
        let long: Double?  = userLocation.coordinate.longitude;
        let lat: Double? = userLocation.coordinate.latitude;
        
        for v in 0...4{
            
            //get everything sorted
            let request = MKLocalSearchRequest()
            request.naturalLanguageQuery = "\(typeOfSearch[v])"
            //ensure you have coordinates
            if let yourLong = long{
                if let yourLat = lat{
                    let locationalized : CLLocationCoordinate2D = CLLocationCoordinate2DMake(yourLat, yourLong)
                    request.region = MKCoordinateRegionMakeWithDistance(locationalized, 1500, 1500)
                    //mklocal search request to get data from apple maps
                    MKLocalSearch(request: request).startWithCompletionHandler { (response, error) in
                        guard error == nil else { return }
                        guard let response = response else { return }
                        guard response.mapItems.count > 0 else { return }
                        //count through results
                        
                        var foundShops : [theServiceObject] = [theServiceObject]()
                        for whichShop in 0...(response.mapItems.count-1){
                            let resultingShop : theServiceObject = theServiceObject()
                            resultingShop.name = response.mapItems[whichShop].name
                            resultingShop.number = response.mapItems[whichShop].phoneNumber
                            foundShops.append(resultingShop)
                        }
                        
                        switch v{
                        case 0 :
                            self.tintShops = foundShops
                            
                        case 1 :
                            self.detaShops = foundShops
                            
                        case 2 :
                            self.acceShops = foundShops
                            
                        case 3 :
                            self.wheeShops = foundShops
                        case 4 :
                            self.bodyShops = foundShops
                        default:
                            print("switch v statement returned default")
                        }
                        
                        
                        
                        //build table
                        dispatch_async(dispatch_get_main_queue(),{
                            self.servDirTable.reloadData()
                        })
                    }
                }
            }
            
            
        }
        
        
        
        
        
    }
    
    
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Location Failed: \(error.localizedDescription)")
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.locationManager.delegate = self
        self.automaticallyAdjustsScrollViewInsets = false
        self.locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.requestLocation()
        
        servDirTable.tableHeaderView = nil
        servDirTable.tableFooterView = nil
        self.servDirTable.contentInset = UIEdgeInsetsMake(-35, 0, 0, 0)
        
        
        
    }
    
    
    
    
    
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var theList : [theServiceObject] = [theServiceObject]()
        
        switch whichTable{
        case 0 :
            theList = self.tintShops
            
        case 1 :
            theList = self.detaShops
            
        case 2 :
            theList = self.acceShops
            
        case 3 :
            theList = self.wheeShops
        case 4 :
            theList = self.bodyShops
        default:
            print("switch v statement returned default")
        }

        
        
        dispatch_async(dispatch_get_main_queue(),{
            if let numb = theList[indexPath.row].number{
                let phoneNumber = numb.componentsSeparatedByCharactersInSet(NSCharacterSet.decimalDigitCharacterSet().invertedSet).joinWithSeparator("")
                
                let phoneNumberAsURL = "tel://\(phoneNumber)"
                let theUrl : NSURL = NSURL(string: phoneNumberAsURL)!
                UIApplication.sharedApplication().openURL(theUrl)
            }
            print("On the emulator, the app seems to freeze. However, on the actual device selecting a shop will launch the dialer and call the shop.")
        })
        
        
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        var theList : [theServiceObject] = [theServiceObject]()
        
        switch whichTable{
        case 0 :
            theList = self.tintShops
            
        case 1 :
            theList = self.detaShops
            
        case 2 :
            theList = self.acceShops
            
        case 3 :
            theList = self.wheeShops
        case 4 :
            theList = self.bodyShops
        default:
            print("switch v statement returned default")
        }
        
        
        return theList.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        
        //build cells
        let cell : serviceDirectoryCell = servDirTable.dequeueReusableCellWithIdentifier("servDirCell") as! serviceDirectoryCell
        
        
        var theList : [theServiceObject] = [theServiceObject]()
        
        switch whichTable{
        case 0 :
            theList = self.tintShops
            
        case 1 :
            theList = self.detaShops
            
        case 2 :
            theList = self.acceShops
            
        case 3 :
            theList = self.wheeShops
        case 4 :
            theList = self.bodyShops
        default:
            print("switch v statement returned default")
        }
        
        
        //get data
        if let shopName = theList[indexPath.row].name{
            if let phoneNum = theList[indexPath.row].number{
                cell.nameLabel.text = String(shopName)
                cell.numberLabel.text = String(phoneNum)
                
            }
        }
        
        return cell
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
