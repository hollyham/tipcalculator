//
//  SettingsViewController.swift
//  tipcalculator
//
//  Created by Holly Ham on 1/1/18.
//  Copyright © 2018 Holly Ham. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipSeg: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = UserDefaults.standard
        if (defaults.object(forKey: "tipDefault") != nil){
            defaultTipSeg.selectedSegmentIndex = defaults.integer(forKey: "tipDefault")
        }
        defaults.synchronize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func changedDefault(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        defaults.set(defaultTipSeg.selectedSegmentIndex, forKey: "tipDefault")
        defaults.set(true, forKey: "defaultHasChanged")
        defaults.synchronize()
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
