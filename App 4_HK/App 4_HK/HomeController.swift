//
//  HomeController.swift
//  App 4_HK
//
//  Created by Hassan Khan on 11/1/18.
//  Copyright © 2018 Hassan Khan. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    @IBOutlet private var legendviewer: UIImageView!
    
    private var images : [UIImage]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //Creating the image array to make our slideshow
        slideshowmaker()
        
        //Adding the slide show images to the imageview, and setting the time
        //and repeat variables for it.
        legendviewer.animationImages = images
        legendviewer.animationDuration = TimeInterval(150)
        legendviewer.animationRepeatCount = 0
        
        //Start the animation my friend, lets rock and roll
        legendviewer.startAnimating()
    }
    
    //Initializing my private data variables here.
    required init?(coder aDecoder: NSCoder)
    {
        images = [UIImage]()
        super.init(coder: aDecoder)
    }
    
    //Function to make an array of all the cover images
    func slideshowmaker()
    {
        images.append(UIImage(named: "intro.jpg")!)
        images.append(UIImage(named: "abbeyRoad.jpg")!)
        images.append(UIImage(named: "BeatlesForSale.jpg")!)
        images.append(UIImage(named: "HardDaysNight.jpg")!)
        images.append(UIImage(named: "help.jpg")!)
        images.append(UIImage(named: "letitbe.jpg")!)
        images.append(UIImage(named: "MagicalMysteryTour.jpg")!)
        images.append(UIImage(named: "PastMastersVolume1.jpg")!)
        images.append(UIImage(named: "PastMastersVolume2.jpg")!)
        images.append(UIImage(named: "pleasePleaseMe.jpg")!)
        images.append(UIImage(named: "revolver.jpg")!)
        images.append(UIImage(named: "rubberSoul.jpg")!)
        images.append(UIImage(named: "sgt_pepper.jpg")!)
        images.append(UIImage(named: "sgtPepper.jpg")!)
        images.append(UIImage(named: "white.jpg")!)
        images.append(UIImage(named: "WithTheBeatles.jpg")!)
        images.append(UIImage(named: "Yellowsubmarine.jpg")!)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
