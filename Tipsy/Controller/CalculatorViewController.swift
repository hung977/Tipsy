//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLable: UILabel!
    
    var tip = "0.0"
    var people = "0.0"
    var valueBillTextField: Float = 0.0
    
    var resultLast = "0.0"
    
    override func viewDidLoad() {
        people = splitNumberLable.text!
        tip = "0.1"
        tenPctButton.isSelected = true
        zeroPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        let userPressed = sender.currentTitle!
        
        if userPressed == "0%" {
            tip = "0"
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        } else if userPressed == "10%" {
            tip = "0.1"
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
        } else {
            tip = "0.2"
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
        }
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLable.text = "\(Int(sender.value))"
        people = splitNumberLable.text!
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        valueBillTextField = Float(billTextField.text!) ?? 0.0
        let tipmoney = valueBillTextField * Float(tip)!
        let result = (valueBillTextField + tipmoney) / Float(people)!
        resultLast = String(format: "%.2f", result)
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = resultLast
            destinationVC.people = people
            destinationVC.tip = tip
        }
    }
    

}

