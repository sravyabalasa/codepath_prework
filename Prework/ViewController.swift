//
//  ViewController.swift
//  Prework
//
//  Created by Sravya Balasa on 3/14/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var billAmountTextField: UITextField!
    @IBOutlet var tipAmountLabel: UILabel!
    @IBOutlet var tipControl: UISegmentedControl!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var splitStepper: UIStepper!
    @IBOutlet var splitLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        
        tipControl.setTitle(defaults.string(forKey: "defaultOne") ?? "15", forSegmentAt: 0)
        tipControl.setTitle(defaults.string(forKey: "defaultTwo") ?? "18", forSegmentAt: 1)
        tipControl.setTitle(defaults.string(forKey: "defaultThree") ?? "20", forSegmentAt: 2)
        _calculateTip()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.billAmountTextField.delegate = self
        self.title = "Tip Calculator"
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        _calculateTip()
    }

    @IBAction func stepperDidStep(_ sender: Any) {
        splitLabel.text = String(Int(splitStepper.value))
        _calculateTip()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        _calculateTip()
        return true
    }
    
    func _calculateTip() {
        let bill = Double(billAmountTextField.text!) ?? 0
        
        let tip1 = (Double(tipControl.titleForSegment(at: 0) ?? "15") ?? 15)/100
        let tip2 = (Double(tipControl.titleForSegment(at: 1) ?? "18") ?? 18)/100
        let tip3 = (Double(tipControl.titleForSegment(at: 2) ?? "20") ?? 20)/100

        let tipPercentages = [tip1, tip2, tip3]

        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = (bill + tip) / splitStepper.value
        
        tipAmountLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

