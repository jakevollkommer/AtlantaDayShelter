//
//  RulesViewController.swift
//  AtlantaDayShelter
//
//  Created by Jake Vollkommer on 11/1/15.
//  Copyright © 2015 Jake Vollkommer. All rights reserved.
//

import UIKit

class RulesViewController: UIViewController {

    let rules = "This is Shelter Survivor! Here are the rules and premises:\nYou are now homeless. Your goal? End your homelessness\nFirst, fill our your intake application. This will (hopefully) get you admitted into one of the day shelters.\n\nYou have three buttons. Heres what they do:\n\nShelter: use this to eat and sleep. Be careful, because you can only eat 3 times a day.\nAlso, you may only sleep at night.\n\nWork: You’ll use this button to work your job, or to apply for a new one.\nFor your first job, you may do day labor or test your chances at taking advantage of the Atlanta Day Shelter’s job attainment program.\nIf you are unlucky, you have to wait until tomorrow to try again.\n\nStore: It has what you need.\nWhen you earn money, it may be wise to spend some of it on professional clothes, for when you have an interview.\nYou probably won’t land a job if you show up to the interview in unprofessional clothes.\n\nEverything you need to know can be read on the screen. These are deemed by your indicators\nEnergy will drain over time\nHealth will increase when you do things proactive for your health\nHunger levels will gradually increase over time\nWork skill can be improved by working\nYou may earn money by working\nThe time of day is shown in the corner of the screen, as well as if it is night time in the other corner.\n\nHow do you win? Get a steadypaying job, be healthy, and be able to sustain yourself.\nThen once you can afford to live at a place on your own, you’ve won.\n\nGood luck!"
    
    override func viewDidLoad() {
        //rulesLabel.text = rules
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK:  Navigation

    // In a storyboardbased application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
