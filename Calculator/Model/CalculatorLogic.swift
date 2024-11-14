//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Berkay Arslan on 14.11.2024.
//  Copyright © 2024 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    private var newNumber : Double?
    private var collectedNumber : (number: Double?,symbol : String?)?
  
    mutating func setNumber(_ number : Double)
    {
        newNumber = number
    }
    
    
  mutating func calculate(with input: String) ->
    Double?    {
        if let n = newNumber {
            
            
            switch input {
            case "AC":
                collectedNumber?.number = nil
                collectedNumber?.symbol = nil
                return 0
            case "+/-":
                return n * -1
            case "%":
                return n * 0.01
            case "=":
                return calculate(n)
            default:
                if collectedNumber == nil {
                    collectedNumber = (number: n,symbol: input)
                }
                else if collectedNumber?.number == nil && collectedNumber?.symbol == nil {
                    collectedNumber?.number = n
                    collectedNumber?.symbol = input
                }
                else if collectedNumber?.number == nil {
                    collectedNumber = (number: n,symbol: input)
                    print("Number is nill")
                }
                else if collectedNumber?.symbol == nil
                {
                    print("Symbol is nill")
                    print(collectedNumber?.symbol)
                    return startCalculation(n,input)
                }
                else
                {
                    print("None of them nill")
                    return startCalculation(n,collectedNumber?.symbol)
                }
                
            }
            
           
            
        }
        
        return nil
        
    }
    
    mutating func calculate(_ number2 : Double) -> Double?
    {
        if let number = collectedNumber?.number, let symbol = collectedNumber?.symbol {
            switch symbol {
            case "+":
                let newValue = number + number2
                collectedNumber?.symbol = nil
                collectedNumber?.number = nil
                return newValue
                case "-":
                let newValue = number - number2
                collectedNumber?.symbol = nil
                collectedNumber?.number = nil
                return newValue
            case "×":
                let newValue = number * number2
                collectedNumber?.symbol = nil
                collectedNumber?.number = nil
                return newValue
                case "÷":
                let newValue = number / number2
                collectedNumber?.symbol = nil
                collectedNumber?.number = nil
                return newValue
            default:
                print("There is no input like that")
            }
        }
        return nil
        
    }
    mutating func startCalculation(_ number2 : Double, _ input : String? = nil) -> Double?
    {
        
        if let number = collectedNumber?.number {
            switch input {
            case "+":
                var newValue = collectedNumber!.number! + number2
                collectedNumber?.number = newValue
                collectedNumber?.symbol = nil
      
                
                return newValue
            case "-":
                var newValue = collectedNumber!.number! - number2
                collectedNumber?.number = newValue
                collectedNumber?.symbol = nil
            case "×":
                var newValue = collectedNumber!.number! * number2
                collectedNumber?.number = newValue
                collectedNumber?.symbol = nil
                return newValue
                case "÷":
                var newValue = collectedNumber!.number! / number2
                collectedNumber?.number = newValue
                collectedNumber?.symbol = nil
                return newValue
            default:
                print("There is not a valid input")
            }
            
        }
        
        return nil
    }
    
    
 
    
    
}
