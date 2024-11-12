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
    
   
    var didFinishEdit : Bool = true
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        didFinishEdit = true
        guard let number = Double(displayLabel.text!) else {
            fatalError("Could not convert to Double")
        }
        if var senderTitle = sender.currentTitle {
            
            switch senderTitle {
            case "AC":
                displayLabel.text = "0"
                senderTitle = "C"
                break
            case "+/-":
                displayLabel.text = String(number * -1)
                break
            case "%":
                displayLabel.text = String(number * 0.01)
                break
            case "C":
                
                break
            default:
                break
                
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

