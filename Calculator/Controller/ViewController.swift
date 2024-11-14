//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
  
   
   private var didFinishEdit : Bool = true
    private var displayValue : Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Could not convert to Double")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    private var calculator = CalculatorLogic()
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        didFinishEdit = true
        calculator.setNumber(displayValue)
        if let title = sender.currentTitle {
           
            if let result = calculator.calculate(with: title) {
                displayValue = result
            }
            
        }
        
    
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        if let numValue = sender.currentTitle {
            if didFinishEdit {
                displayLabel.text = numValue
                didFinishEdit = false
            }
            else {
                if numValue == "." {
                    print("Tapped to . ")
                    if displayLabel.text!.contains(".") {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
               
            }
            
        }
    
    }

}

