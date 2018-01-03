//
//  ViewController.swift
//  tipcalculator
//
//  Created by Holly Ham on 12/30/17.
//  Copyright © 2017 Holly Ham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var resultContainer: UIView!
    @IBOutlet weak var splitControl: UISegmentedControl!
    @IBOutlet weak var twoPersonLabel: UILabel!
    @IBOutlet weak var threePersonLabel: UILabel!
    @IBOutlet weak var fourPersonLabel: UILabel!
    
    let formatter = NumberFormatter()
    var resultIsHidden = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.billField.becomeFirstResponder()
        
        // Updates text field placeholder to match region's currency
        formatter.numberStyle = .currency
        billField.placeholder = formatter.currencySymbol
        
        let defaults = UserDefaults.standard
        
        // Checks if there is a saved bill amount
        if( defaults.object(forKey: "billAmount") != nil ){
            let timeAtClose = defaults.object(forKey: "closeTime") as! NSDate
            let duration = timeAtClose.timeIntervalSinceNow
            if( duration > -600 ){
                // Duration is less than 10 minutes (600 seconds)
                billField.text = defaults.string(forKey: "billAmount")
            }
            // Tip and Total should be visible
            resultIsHidden = false
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = UserDefaults.standard
        if (defaults.object(forKey: "tipDefault") != nil){
            // Changes tipControl to match default selection
            tipControl.selectedSegmentIndex = defaults.integer(forKey: "tipDefault")
        }
        if (defaults.object(forKey: "splitDefault") != nil){
            splitControl.selectedSegmentIndex = defaults.integer(forKey: "splitDefault")
        }
        defaults.synchronize()
        
        calculateTip(self)
        //emptyFieldCheck(textField: billField)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        
        let tipPercentages = [0.15, 0.18, 0.2]
        
        let bill = Double(billField.text!) ?? 0
        emptyFieldCheck(textField: billField)
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        let calculatedVals = [total, tip]
        let twoPersonCost = calculatedVals[splitControl.selectedSegmentIndex]/2
        let threePersonCost = calculatedVals[splitControl.selectedSegmentIndex]/3
        let fourPersonCost = calculatedVals[splitControl.selectedSegmentIndex]/4
        
        // Uses correct currency sign for tip and total
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        
        // Main Labels
        tipLabel.text = String(format: "%@", formatter.string(from: tip as NSNumber)! )
        totalLabel.text = String(format: "%@", formatter.string(from: total as NSNumber)! )
        
        // Split Labels
        twoPersonLabel.text = String(format: "%@", formatter.string(from: twoPersonCost as NSNumber)! )
        threePersonLabel.text = String(format: "%@", formatter.string(from: threePersonCost as NSNumber)! )
        fourPersonLabel.text = String(format: "%@", formatter.string(from: fourPersonCost as NSNumber)! )
        
        let defaults = UserDefaults.standard
        // Saves entered entered bill amount
        defaults.set(billField.text, forKey: "billAmount")
        defaults.set(Date(), forKey: "closeTime")
        
        defaults.synchronize()
    }
    
    
    func emptyFieldCheck(textField: UITextField) {
        
        // Checks if textfield is empty but result if not hidden
        if(textField.text == "" && !resultIsHidden){
            // Hides results
            UIView.animate(withDuration: 0.2,
                animations:{
                    self.tipControl.center.y += self.view.bounds.height
                    self.resultContainer.center.y += self.view.bounds.height
                    self.billField.center.y += 80
                }
            )
            resultIsHidden = true
        }
        // Checks if there is input in textfield but results are hidden
        else if(textField.text != "" && resultIsHidden){
            UIView.animate(withDuration: 0.2,
                animations: {
                    self.tipControl.center.y -= self.view.bounds.height
                    self.resultContainer.center.y -= self.view.bounds.height
                    self.billField.center.y -= 80
                }
            )
            resultIsHidden = false
        }
    }
}

