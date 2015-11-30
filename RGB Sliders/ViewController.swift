//
//  ViewController.swift
//  RGB Sliders
//
//  Created by Zane Jeka on 11/16/15.
//  Copyright © 2015 Zane Jeka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet var colorSquare : UIView?

    
   
        // Do any additional setup after loading the view, typically from a nib.
    override func viewDidLoad() {
        super.viewDidLoad()
        colorSquare!.layer.borderColor = UIColor.blackColor().CGColor
        colorSquare!.layer.borderWidth = 1
        
        // Do any additional setup after loading the view, typically from a nib.
        
        updateBackgroundColor()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        redSlider.value = defaults.floatForKey("red")
        greenSlider.value = defaults.floatForKey("green")
        blueSlider.value = defaults.floatForKey("blue")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func updateBackgroundColor() {
        let red = CGFloat(redSlider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(blueSlider.value)
        
        // view.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
        self.colorSquare!.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
        let defaults = NSUserDefaults.standardUserDefaults()  //1
        defaults.setFloat(redSlider.value, forKey: "red")   //2
        defaults.setFloat(greenSlider.value, forKey: "green")
        defaults.setFloat(blueSlider.value, forKey: "blue")
        defaults.synchronize()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "openColor") {
            let newViewController = segue.destinationViewController
            newViewController.view.backgroundColor = colorSquare!.backgroundColor
        }
    }
    
    
}

