//
//  ViewController.swift
//  AtlantaDayShelter
//
//  Created by Jake Vollkommer on 9/19/15.
//  Copyright (c) 2015 Jake Vollkommer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var mealCounter = 0
    var energy = 100
    var workSkill = 0
    var health = 50
    var hunger = 0
    var wealth = 100
    var checkDay = Bool(true)
    var dayCounter = 0
    var inventory = NSMutableArray()
    var attainmentLimit = 0
    var minuteCounter = 0
    var hourCounter = 8
    var ampm = "AM"
    
    //Prices of buyable items
    var storeItems: [String] = ["Shirt","Pants","Shoes","Socks","Tie","Blazer"]
    var storePrices: [Int] = [15,35,20,2,5,60]
    var itemNames: [String] = ["shirt","pair of pants","pair of shoes","pair of socks","tie","blazer"]
    var itemsBought = 0
    let shirtPrice = 15
    let pantsPrice = 35
    let shoesPrice = 20
    let socksPrice = 2
    let tiePrice = 5
    let blazerPrice = 60
    
    //Make Shelter's options
    var shelterOptions = UIAlertController(title: "What would you like to do here?", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
    var shelterCounter = 0
    
    var alertTitle = "Would you like to work?"
    
    @IBAction func work(sender: UIButton) {
        //ADD RNG TO THE JOB ATTAINMENT PROGRAM, CAN CHECK ONCE PER DAY
        if workSkill >= 100{
            
        }
        else if workSkill >= 50 {
            
        }
        else if workSkill >= 10 {
            
        }
        else {
            //work skill 0, ask for job attainment program
            alertTitle = NSString(format:"Your work skill level is %d. Would you like to do day labor?", workSkill) as String;
            let askForWork = UIAlertController(title: alertTitle, message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
            askForWork.addAction(UIAlertAction(title: "No. Try the job attainment program!", style: UIAlertActionStyle.Destructive, handler:{ (alert :UIAlertAction!) -> Void in
                self.jobAttainmentProgram()
            }))
            self.presentViewController(askForWork, animated: true, completion: nil)
        }
    }

    @IBAction func store(sender: AnyObject) {
        
        //create the store and its initial items
        let storeInterface = UIAlertController(title: "What would you like to buy?", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        
            //        var i = 0
            //
            //        for object in storeItems{
            //            print(storeItems[i])
            //            print(storePrices[i])
            //            print(itemNames[i])
            //            storeInterface.addAction(UIAlertAction(title: object as! String, style: UIAlertActionStyle.Default, handler: { (alert :UIAlertAction!) -> Void in
            //                self.buyItem(self.storePrices[i], itemName: self.itemNames[i])
            //            }))
            //            print("i is",i)
            //            i++
            //
            //        }
            storeInterface.addAction(UIAlertAction(title: "Shirt", style: UIAlertActionStyle.Default, handler: { (alert :UIAlertAction!) -> Void in
                self.buyItem(self.shirtPrice, itemName: "shirt")
            }))
            storeInterface.addAction(UIAlertAction(title: "Pants", style: UIAlertActionStyle.Default, handler: { (alert :UIAlertAction!) -> Void in
                self.buyItem(self.pantsPrice, itemName: "pair of pants")
            }))
            storeInterface.addAction(UIAlertAction(title: "Shoes", style: UIAlertActionStyle.Default, handler: { (alert :UIAlertAction!) -> Void in
                self.buyItem(self.shoesPrice, itemName: "pair of shoes")
            }))
            storeInterface.addAction(UIAlertAction(title: "Socks", style: UIAlertActionStyle.Default, handler: { (alert :UIAlertAction!) -> Void in
                self.buyItem(self.socksPrice, itemName: "pair of socks")
            }))
            storeInterface.addAction(UIAlertAction(title: "Tie", style: UIAlertActionStyle.Default, handler: { (alert :UIAlertAction!) -> Void in
                self.buyItem(self.tiePrice, itemName: "tie")
            }))
            storeInterface.addAction(UIAlertAction(title: "Blazer", style: UIAlertActionStyle.Default, handler: { (alert :UIAlertAction!) -> Void in
                self.buyItem(self.blazerPrice, itemName: "blazer")
            }))
            storeInterface.addAction(UIAlertAction(title: "Go back", style: UIAlertActionStyle.Destructive, handler: nil))
        

        self.presentViewController(storeInterface, animated: true, completion: nil)
    }
    
    func buyItem(itemPrice:NSInteger,itemName:NSString){
        
        storeItems.removeAtIndex(itemsBought)
        storePrices.removeAtIndex(itemsBought)
        itemNames.removeAtIndex(itemsBought)
        
        
        print (storeItems)
        
        if wealth >= itemPrice{
            //if the user has enough money, buy the item
            wealth = wealth - itemPrice
            wealthLabel.text = NSString(format:"$ %d",wealth) as String
            itemsBought++
            inventory.addObject(itemName)
            energy = energy - 10
            print(itemName)
            let myMessage = NSString(format:"You've bought a stylish %@!", itemName) as String;
            let userBoughtItem = UIAlertController(title: myMessage, message: nil, preferredStyle: UIAlertControllerStyle.Alert)
            userBoughtItem.addAction(UIAlertAction(title: "Great!", style: UIAlertActionStyle.Destructive, handler: nil))
            self.presentViewController(userBoughtItem, animated: true, completion: nil)
        }
        else{
            let cantBuyItem = UIAlertController(title: "Sorry, you don't have enough to buy this item.", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
            cantBuyItem.addAction(UIAlertAction(title: "Okay.", style: UIAlertActionStyle.Destructive, handler: nil))
                self.presentViewController(cantBuyItem, animated: true, completion: nil)
        }
        //potentially add extra items to the store depending on what they've bought
        
    }
    func addShelter(){
        shelterOptions.addAction(UIAlertAction(title: "Eat", style: .Default, handler: { action in
            switch action.style{
            case .Default:
                if self.hunger == 0{
                    //Don't let the user eat if he's not hungry
                    let cantEat = UIAlertController(title: "You're not hungry!", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
                    cantEat.addAction(UIAlertAction(title: "Okay, go back!", style: UIAlertActionStyle.Destructive, handler:self.returnHome))
                    self.presentViewController(cantEat, animated: true, completion: nil)
                    
                }
                else{
                    //If the user is hungry, he may eat.
                    self.eat()
                }
            case .Cancel:
                return
            case .Destructive:
                return
            }
            
        }))
        
        //Option to sleep to restore energy
        shelterOptions.addAction(UIAlertAction(title: "Sleep", style: .Default, handler: { action in
            switch action.style{
            case .Default:
                if self.checkDay{
                    //User can't sleep if it's daytime
                    let cantSleep = UIAlertController(title: "You can't sleep yet, it's still day time!", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
                    cantSleep.addAction(UIAlertAction(title: "Okay, go back!", style: UIAlertActionStyle.Destructive, handler:self.returnHome))
                    self.presentViewController(cantSleep, animated: true, completion: nil)
                }
                    
                else{
                    //If it's night time, user may sleep
                    self.sleep()
                }
            case .Cancel:
                return
            case .Destructive:
                return
            }
        }))
        shelterOptions.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Destructive, handler: nil ))

    }
    @IBOutlet weak var energyLabel: UILabel!
    @IBOutlet weak var healthLabel: UILabel!
    @IBOutlet weak var hungerLabel: UILabel!
    @IBOutlet weak var wealthLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var workSkillLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBAction func home(sender: UIButton) {
        
        //Create the options only once
        if shelterCounter == 0{
            self.addShelter()
            shelterCounter++
        }
        //Show Shelter's options
        self.presentViewController(shelterOptions, animated: true, completion: nil)
    }
    func eat(){
        if mealCounter < 3{
        //User eats
        print("You eat. You are now less hungry, more healthy, and have more energy.")
            let youAte = UIAlertController(title: "You eat. You are now less hungry, more healthy, and have more energy.", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
            youAte.addAction(UIAlertAction(title: "Great!", style: UIAlertActionStyle.Destructive, handler:nil))
            self.presentViewController(youAte, animated: true, completion: nil)
        energy++
        health++
        hunger = hunger - 30
            if hunger < 0 {
                hunger = 0
            }
        //Change stats. Notify user.
        healthLabel.text = NSString(format:"Health: %d", health) as String;
        energyLabel.text = NSString(format:"Energy: %d", energy) as String;
        hungerLabel.text = NSString(format:"Hunger: %d", hunger) as String;
        mealCounter++
        }
        else {
            print("You already had 3 meals today.")
            let tooManyMeals = UIAlertController(title: "You've already had 3 meals today. Sorry!", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
            tooManyMeals.addAction(UIAlertAction(title: "Okay, go back!", style: UIAlertActionStyle.Destructive, handler:self.returnHome))
            self.presentViewController(tooManyMeals, animated: true, completion: nil)
        }
    }
    func sleep() {
        //User sleeps
        print("You sleep.")
        energy = 100
        health++
        mealCounter = 0
        hunger = hunger + 20
        hungerLabel.text = NSString(format:"Hunger: %d", hunger) as String;
        healthLabel.text = NSString(format:"Health: %d", health) as String;
        energyLabel.text = NSString(format:"Energy: %d", energy) as String;
        let youSlept = UIAlertController(title: "You sleep. Your enegy is restored and your health has increased.", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        youSlept.addAction(UIAlertAction(title: "Great!", style: UIAlertActionStyle.Destructive, handler:nil))
        self.presentViewController(youSlept, animated: true, completion: nil)
        self.checkDaytime()
    }
    
    //If the user can not eat/sleep, return to shelter's options
    func returnHome(alert: UIAlertAction!) {
        self.presentViewController(shelterOptions, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let energyDrain = NSTimer.scheduledTimerWithTimeInterval(4, target: self, selector: "drainEnergy", userInfo: nil, repeats: true)
        let hungerDrain = NSTimer.scheduledTimerWithTimeInterval(10, target: self, selector: "drainHunger", userInfo: nil, repeats: true)
        let dayProgression = NSTimer.scheduledTimerWithTimeInterval(60, target: self, selector: "checkDaytime", userInfo: nil, repeats: true)
        let dayCountdown = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "countdownDay", userInfo: nil, repeats: true)
        wealthLabel.text = NSString(format:"$ %d", wealth) as String;
        healthLabel.text = NSString(format:"Health: %d", health) as String;
        energyLabel.text = NSString(format:"Energy: %d", energy) as String;
    }
    func jobAttainmentProgram(){
        if attainmentLimit == 0 {
            let randomNum: Int = random() % 10
            print(randomNum)
            if randomNum >= 7 {
                //Got into job attainment program
                let programAccepted = UIAlertController(title: "Congratulations! We can help you get a job through our job attainment program!", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
                programAccepted.addAction(UIAlertAction(title: "Awesome!", style: UIAlertActionStyle.Destructive, handler:self.returnHome))
                self.presentViewController(programAccepted, animated: true, completion: nil)
                
                //Get job
            }
            else {
                //Did not get into job attainment program
                let programFull = UIAlertController(title: "Sorry, we are unable to help you through the job attainment program at this time. Please try again tomorrow!", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
                programFull.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Destructive, handler:self.returnHome))
                self.presentViewController(programFull, animated: true, completion: nil)
                attainmentLimit++
            }
        }
        else {
            //Reached limit for today
            let limitReached = UIAlertController(title: "You've already applied today. Try again tomorrow.", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
            limitReached.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Destructive, handler:self.returnHome))
            self.presentViewController(limitReached, animated: true, completion: nil)
        }
        
    }
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.LandscapeLeft
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func drainEnergy(){
        if energy > 0 {
            energy--
            energyLabel.text = NSString(format:"Energy: %d", energy) as String;
        }
        else {
            print("You are dead")
            return
        }
    }
    func drainHunger(){
        if hunger < 100 {
            hunger = hunger + 10
            hungerLabel.text = NSString(format:"Hunger: %d", hunger) as String;
        }
        else {
            print("You are dead")
            return
        }
    }
    func checkDaytime(){
        if dayCounter % 2 == 0{
            checkDay = false
            dayCounter++
        }
        else {
            checkDay = true
            dayCounter++
        }
        if checkDay {
            dayLabel.text = ("It is day time.")
            ampm = "AM"
            mealCounter = 0
            hourCounter = 8
            minuteCounter = 0
        }
        else {
            dayLabel.text = ("It is night time.")
            hourCounter = 8
            minuteCounter = 0
        }
    }
    func countdownDay() {
        //make this countdown to night time. 12 hour day, starting at 8 am and ending at 8 pm. Make a day last 60 seconds perhaps.
        minuteCounter = minuteCounter + 10
        timeLabel.text = NSString(format: "%d:%d %@", hourCounter,minuteCounter, ampm) as String;
        if minuteCounter >= 60 {
            minuteCounter = 0
            hourCounter++
            timeLabel.text = NSString(format: "%d:%.02d %@", hourCounter,minuteCounter, ampm) as String;
        }
        if hourCounter >= 12 {
            hourCounter = 1
            ampm = "PM"
        }
    }
    
}
