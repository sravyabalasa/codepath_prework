//
//  SettingsViewController.swift
//  Prework
//
//  Created by Sravya Balasa on 3/14/21.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var defaultOne: UITextField!
    @IBOutlet var defaultTwo: UITextField!
    @IBOutlet var defaultThree: UITextField!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = UserDefaults.standard
        defaultOne.text = defaults.string(forKey: "defaultOne") ?? "15"
        defaultTwo.text = defaults.string(forKey: "defaultTwo") ?? "18"
        defaultThree.text = defaults.string(forKey: "defaultThree") ?? "20"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        defaults.set(defaultOne.text, forKey: "defaultOne")
        defaults.set(defaultTwo.text, forKey: "defaultTwo")
        defaults.set(defaultThree.text, forKey: "defaultThree")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
    }
}
