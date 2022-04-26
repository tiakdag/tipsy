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
    @IBOutlet weak var zeroPercent: UIButton!
    @IBOutlet weak var tenPercent: UIButton!
    @IBOutlet weak var twentyPercent: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var total = ""
    var percent = ""
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        title = sender.currentTitle!
        switch title {
        case "0%": zeroPercent.isSelected = true
        tenPercent.isSelected = false
        twentyPercent.isSelected = false
        case "10%": tenPercent.isSelected = true
        zeroPercent.isSelected = false
        twentyPercent.isSelected = false
        case "20%": twentyPercent.isSelected = true
        zeroPercent.isSelected = false
        tenPercent.isSelected = false
        default: print("error")
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f",sender.value)
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        var billTotal = Double(billTextField.text ?? "0.0") ?? 0.0
        let people = Double(splitNumberLabel.text!)!
        
        if zeroPercent.isSelected == true {
            billTotal = billTotal / people
            percent = "0%"
        }else if tenPercent.isSelected{
            billTotal = (billTotal + billTotal * 0.1) / people
            percent = "10%"
        }else{
             billTotal = (billTotal + billTotal * 0.2) / people
            percent = "20%"
        }
        total = String(format: "%.2f",billTotal)
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.total = total
            destinationVC.tipPercentage = percent
            destinationVC.numPeople = splitNumberLabel.text!
        }
        
    }
    
}

