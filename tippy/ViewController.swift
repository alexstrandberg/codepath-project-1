//
//  ViewController.swift
//  tippy
//
//  Created by Alexander Strandberg on 6/14/16.
//  Copyright © 2016 Alexander Strandberg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    var tipPercentages = [18, 20, 25]
    
    let defaults = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        /*let lastClosed = defaults.doubleForKey("lastClosed")
        if lastClosed != 0 {
            if NSTimeIntervalSince1970 < (lastClosed + 5) {
                if let lastBillField = defaults.stringForKey("lastBillField") {
                    billField.text = lastBillField
                    calculateTip()
                }
            }
        }*/
        
        billField.becomeFirstResponder()
    }
    
    override func viewWillAppear(animated: Bool) {
        loadTipPercentages()
        calculateTip()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tipChosen(sender: AnyObject) {
        calculateTip()
    }
    
    func calculateTip() {
        let bill = Double(billField.text!) ?? 0
        
        /*if let text = billField.text {
            defaults.setObject(text, forKey: "lastBillField")
            defaults.setDouble(NSTimeIntervalSince1970, forKey: "lastClosed")
            defaults.synchronize()
        }
        */
        let tip = bill * Double(tipPercentages[tipControl.selectedSegmentIndex]) / 100.0
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    func loadTipPercentages() {
        let tip1Stored = defaults.integerForKey("tip1")
        let tip2Stored = defaults.integerForKey("tip2")
        let tip3Stored = defaults.integerForKey("tip3")
        
        if tip1Stored != 0 {
            tipPercentages[0] = tip1Stored
            tipControl.setTitle(String(tip1Stored)+"%", forSegmentAtIndex: 0)
        }
        
        if tip2Stored != 0 {
            tipPercentages[1] = tip2Stored
            tipControl.setTitle(String(tip2Stored)+"%", forSegmentAtIndex: 1)
        }
        
        if tip3Stored != 0 {
            tipPercentages[2] = tip3Stored
            tipControl.setTitle(String(tip3Stored)+"%", forSegmentAtIndex: 2)
        }
    }
}