//
//  SettingsViewController.swift
//  tippy
//
//  Created by Alexander Strandberg on 6/14/16.
//  Copyright © 2016 Alexander Strandberg. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var tip1Field: UITextField!
    @IBOutlet weak var tip2Field: UITextField!
    @IBOutlet weak var tip3Field: UITextField!
    
    var tipPercentages = [18, 20, 25]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        loadTipPercentages()
        tip1Field.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func loadTipPercentages() {
        let defaults = NSUserDefaults.standardUserDefaults()
        let tip1Stored = defaults.integerForKey("tip1")
        let tip2Stored = defaults.integerForKey("tip2")
        let tip3Stored = defaults.integerForKey("tip3")
        
        if tip1Stored != 0 {
            tipPercentages[0] = tip1Stored
            tip1Field.text = String(tip1Stored)
        }
        
        if tip2Stored != 0 {
            tipPercentages[1] = tip2Stored
            tip2Field.text = String(tip2Stored)
        }
        
        if tip3Stored != 0 {
            tipPercentages[2] = tip3Stored
            tip3Field.text = String(tip3Stored)
        }
    }
    @IBAction func textFieldChanged(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        if let text = tip1Field.text, newTip1 = Int(text) {
            defaults.setInteger(newTip1, forKey: "tip1")
        }
        
        if let text = tip2Field.text, newTip2 = Int(text) {
            defaults.setInteger(newTip2, forKey: "tip2")
        }
        
        if let text = tip3Field.text, newTip3 = Int(text) {
            defaults.setInteger(newTip3, forKey: "tip3")
        }
        
        defaults.synchronize()
    }
}
