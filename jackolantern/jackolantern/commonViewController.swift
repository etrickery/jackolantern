//
//  commonViewController.swift
//  jackolantern
//
//  Created by Eric Pfister on 8/9/16.
//  Copyright © 2016 com.etrickery. All rights reserved.
//

import UIKit




class commonViewController : ViewController, UITableViewDelegate, UITableViewDataSource{

    
    
    @IBOutlet weak var commonTable: UITableView!
    
    var commonCollection : [commonTableData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        let common1 : commonTableData = commonTableData(title: "Flat tire", details: "   A 'flat' tire is a deflated tire. This is usually caused by a puncture, leaking valve stem , a cracked wheel or improper sealing around the bead or edge of the rim. A check of the tire's surface should reveal possible causes, however the cause may be hard to find. If the tire will hold air, and you have access to an air compressor, inflate the tire to the manufacturers recommended tire pressure. Listen for hissing noises from the tire after airing it up (you may have to get away from the air compressor). A mixture of soap and water in a spray bottle can be sprayed on the tire to help locate the leak. Anywhere air escapes, it will blow bubbles from the soapy mix. If a leak is slower, and cannot easily be detected, the tire can be reinflated and held under water in a large tank. This will reveal smaller leaks that are much harder to locate. Some of these problems can be solved through patching the tire or resealing it. Tires punctured on the shoulder or side wall cannot be repaired and should be replaced.\n\n   Most vehicles are equipped with a jack, spare tire, and the tools to perform the task. These tools are not the optimal tools for the job, they are optimal tools to hide in a small compartment. Upgrading these tools prior to having the problem is a great way to be well prepared. Visit your local parts store to purchase better quality tools for repairs like this. The spare tire is only designed to get your vehicle to the shop and shouldn't be used for very long. Very few vehicles carry a full size spare, mostly only trucks or older vehicles. Recently, vehicles have begun to shed spare tires and jacks to save on weight and space. They are instead equipped with an airpump and roadside assistance.\n\n   Contact AAA, your manufacturer roadside assistance, or a towing service for assistance. Some car insurance providers also cover vehicle rescue in situations such as this.", image: "tires.jpg")
        commonCollection.append(common1)
        
        let common2 : commonTableData = commonTableData(title: "Lightbulb out", details: "Using a helper to activate the lights, one at a time and combining lights, circle the car checking all bulbs are functioning. Any bulbs that are not working should be replaced. A variety of videos and tutorials exist online for almost any vehicle to teach you how to change most bulbs. ", image: "headlights.jpg")
        commonCollection.append(common2)
        
        let common3 : commonTableData = commonTableData(title: "Been in an Accident", details: "Ensure everyone is ok and safe. Be cautious exiting the vehicle. Watch traffic to ensure safety. Examine vehicles for damage. Call the police and report the accident. Take pictures, try to get contact information for any witnesses. Exchange contact and insurance information with the other driver. Contact your insurance provider for instructions on setting up a claim for damages. In the event your vehicle is hit and the driver attempts to flee the accident, try to get their license plate number. Again, try to find witnesses and look around for cameras on local businesses. While they may not share the video with you, the police department may be able to locate the driver from that video. File a police report and contact your insurance company. Never admit fault, but do not lie to responders at the scene or police officers. Lieing will prove much worse than being at fault for an accident. Be sure to write everything down, as it is easy to forget details, especially after a tramatic event such as a wreck.", image: "wreck.jpg")
        commonCollection.append(common3)
        
        let common4 : commonTableData = commonTableData(title: "Jump Starting a Vehicle", details: "It is a good idea to carry a good set of jumper cables in your vehicle. Keep them in a bag, and store them in the vehicle. If you don't have them, you must rely on someone to help you who also has jumper cables. Keep in mind, that jumpstarting a vehicle can cause damage to your vehicle if done improperly. Hooking up battery cables backwards or shorting across the terminals (connecting the battery terminals to each other) can cause batteries to fail, become weaker, or even explode. Battery acid is very corrosive and it can ruin clothing. The most dangerous aspect is it can blind you, burn your skin, and cause death in extreme cases. The battery gives off flamable gasses so sparks caused by connecting the cables can ignite it. Be careful when jumpstarting a vehicle. If you have the opportunity to have someone show you the proper procedure, it will help greatly should you have to do it on your own.\n\n Place both vehicles in Park and shut off the ignition. \n\nEngage parking brakes if equipped and functional. \n\nAttach one RED cable to the dead vehicle's POSITIVE (+) battery terminal first.\n\n Ensure the cable ends do not touch each other at either end.\n\nAttach the other RED cable end to the donor vehicle's POSITIVE(+) battery terminal.\n\nAttach the BLACK cable to the donor vehicle battery NEGATIVE(-) post. \n\nAttach the last BLACK cable end to the dead vehicle's metal frame away from the battery.\n\nStart the donor vehicle, and let it run for a few minutes. \n\nAttempt to start the dead vehicle.\n\nIf it doesn't start, wait five minutes with the donor vehicle running, and try again.\n\nIf the vehicle still fails to start, your battery may be too far gone to save.", image: "openHood.jpg")
        commonCollection.append(common4)
        
        let common5 : commonTableData = commonTableData(title: "Brake System Problems", details: "Beware braking system problems, as a vehicle that cannot stop is very dangerous to drive. \n\nIf your steering wheel shakes when you brake, especially at higher speeds, then your rotors are warped or out-of-round. They should be resurfaced or turned. Sometimes, they may be too thin to resurface. This will cause them to not cool properly during use, and they will warp again. If the seat and floor seem to shake more than the steering wheel, then the rear brakes are likely at fault. \n\nNoises in the braking system can indicate a variety of problems or could just be noisey pads. Sometimes the surface of the pads can become contaminated, from rusty brake dust, rainwater, chemicals or fluids from the environment the vehicle is being operated within. Cleaning and adjusting of the braking system will generally solve this problem. Some brake pads are just noisier than others. Squealing can indicate pads are too thin and must be replaced, so if they make noise you should check or have them checked. Drum brakes, commonly used on rear wheels of most vehicles, are more prone to noises and adjustment issues. Emergency braking systems can cause noise as well due to rarely being used. \n\nGrinding noises are usually an indication that the brakes have run out of pad material and are now mashing the pad backing plate into the rotor. Due to this, rotors will not last long without requiring replacement.\n\nBraking problems should always be a priority due to safety concerns.", image: "brakes.jpg")
        commonCollection.append(common5)
        
        let common6 : commonTableData = commonTableData(title: "Tire Alignment Problems", details: "Tire alignment problems will generally manifest as pulling to one side as you drive. While an arched road surface, known as road crown, will cause a vehicle to drift towards the roadside, alignment problems will push a car around the road even on very flat surfaces. \n\nThe more sinister problems may not be obvious. Over a few thousand miles, tires can be damaged from alignment issues. The damage can occur so swiftly that by the time the driver is aware of the issue, the tire will be too far damaged to save. Checking tire tread with a depth guage, at multiple points on a tire, will allow the driver to catch these sorts of problems quickly. Many shops also offer free alignment checks as you drive into their service department. ", image: "tires.jpg")
        commonCollection.append(common6)
        
        let common7 : commonTableData = commonTableData(title: "Locked out of your car", details: "Buy a spare door key small enough to fit in your wallet. While it is dangerous to use a 'hide-a-key' box on your vehicle, it could be an option if you are prone to locking your keys in your vehicle. A locksmith can enter your vehicle using tools without damaging it. Many towing companies now offer lock-out service as well. Since these services can be generally expensive, it is a good idea to plan ahead and keep a spare key. Some new vehicles offer roadside assistance, insurance companies do as well. Some are even equipped with systems that offer remote unlocking from the manufacturer's smartphone application.", image: "keyfob.jpg")
        commonCollection.append(common7)
        
        let common8 : commonTableData = commonTableData(title: "Checking your fluids", details: "Check fluids often. Refer to your owners manual or maintenance provider for exact specifications. \n\nOil can be checked hot or cold. With the vehicle off for a few minutes, pull the dipstick and wipe it off. Return it to the tube and insert it all the way. Remove it and yous should find an oil line in the middle of a hashmark or a pair of dips in the side of the dipstick. Do not add oil until it drops below the hashmarks. Add small amounts until it is full, pausing for a couple minutes before checking the level again.\n\nBe cautious checking fluids hot. Checking the coolant when cold, always remove the radiator cap slowly. When the vehicle is hot, coolant will spray out around the radiator cap and will burn you with steam and boiling water. It is best to check hot antifreeze with the vehicle running. Do not mix antifreeze types ever. There is no such thing as universal antifreeze. Find the exact type your vehicle requires and use it. Mixing antifreeze types can cause it to clump up and plug vehicle components. Leaking fluid additives such as stop leaking products should not be used, they do not work and cause long term problems. \n\nTransmission fluid must be checked warmed, after driving the vehicle. Again, do not mix fluids. You must only use the fluid your vehicle requires. You may not be able to check the fluid, some vehicles must be taken to the dealership to have the level checked. The fluid temperature is required to know what the current level is (or should be).\n\nThere are very few types of brake fluid but they are very different. You cannot mix them. Clutches often use brake fluid. Check the level inside the reservoir and top off as neccesary. \n\n", image: "engineBay.jpg")
        commonCollection.append(common8)
        
    }
    
    
    //table stuff
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //launch segue
        dispatch_async(dispatch_get_main_queue(),{
            self.performSegueWithIdentifier("commProbToDetailsSegue", sender: indexPath)
        })
        
        
    }
    
    
    
    //makeToModelSegue
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "commProbToDetailsSegue" {
            return true
        }
        return false
    }

    
    
    
    //tble stuff
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return commonCollection.count
    }
    
    
    //table stuff
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell : commonCell = commonTable.dequeueReusableCellWithIdentifier("commonCell")! as! commonCell
        //index
        let currentCommon : commonTableData = commonCollection[indexPath.row]
        //get title
        cell.commonLabel.text = currentCommon.title
        return cell
    }
    
    //segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let getCommonDetails = segue.destinationViewController as! commonDetailsViewController
        let indexPath : NSIndexPath? = commonTable.indexPathForSelectedRow
        getCommonDetails.selectedCommon = commonCollection[indexPath!.row]
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


