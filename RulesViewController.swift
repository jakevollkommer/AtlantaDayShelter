//
//  RulesViewController.swift
//  AtlantaDayShelter
//
//  Created by Jake Vollkommer on 11/1/15.
//  Copyright © 2015 Jake Vollkommer. All rights reserved.
//

import UIKit

class RulesViewController: UIViewController {

    let rules = "This is Shelter Survivor! Here are the rules and premises:\nYou are now homeless. Your goal? End your homelessness\n\nFirst, fill our your intake application. This will (hopefully) get you admitted into one of the day shelters.\n\nYou have three buttons. Heres what they do:\n\nShelter:\n\nUse this to eat and sleep. Be careful, because you can only eat 3 times a day. Also, you may only sleep at night.\n\nWork:\n\nYou’ll use this button to work your job, or to apply for a new one.\nFor your first job, you may do day labor or test your chances at taking advantage of the Atlanta Day Shelter’s job attainment program.\nIf you are unlucky, you have to wait until tomorrow to try again.\n\nStore:\n\nIt has what you need.\nWhen you earn money, it may be wise to spend some of it on professional clothes, for when you have an interview.\nYou probably won’t land a job if you show up to the interview in unprofessional clothes.\n\nEverything you need to know can be read on the screen.\n\nThese are deemed by your indicators:\n-Energy will drain over time\n-Health will increase when you do things proactive for your health\n-Hunger levels will gradually increase over time\n-Work skill can be improved by working\n-You may earn money by working, and you'll get paid at the end of each week\n-The time of day is shown in the corner of the screen,\nas well as if it is night time in the other corner.\n\nHow do you win? Get a steadypaying job, be healthy, and be able to sustain yourself.\nThen once you can afford to live at a place on your own, you’ve won.\n\nGood luck!"
    
    @IBOutlet weak var scrollView: UIScrollView!
    var imageView: UIImageView!
    
    override func viewDidLoad() {
        
        view.backgroundColor = UIColor.blackColor()
        
        let label = UILabel(frame: CGRectMake(0, 0, 568, 900))
        label.center = CGPointMake(320, 450)
        label.textAlignment = NSTextAlignment.Center
        label.text = rules
        label.textColor = UIColor.yellowColor()
        label.font = UIFont(name: "GillSans", size: 17)
        label.numberOfLines = 0
        scrollView.contentSize.height = 950
        scrollView.addSubview(label)
        
        let button = UIButton(type: UIButtonType.System) as UIButton
        button.frame = CGRectMake(197,905,250,15)
        button.setTitle("Okay, show me the application!", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.greenColor(), forState: .Normal)
        button.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        scrollView.addSubview(button)

        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func buttonAction(sender:UIButton!)
    {
        //Segue to application
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc: ApplicationViewController = storyboard.instantiateViewControllerWithIdentifier("ApplicationView") as! ApplicationViewController

        self.presentViewController(vc, animated: true, completion: nil)

    }
    func RBResizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / image.size.width
        let heightRatio = targetSize.height / image.size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSizeMake(size.width * heightRatio, size.height * heightRatio)
        } else {
            newSize = CGSizeMake(size.width * widthRatio,  size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRectMake(0, 0, newSize.width, newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.drawInRect(rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
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
