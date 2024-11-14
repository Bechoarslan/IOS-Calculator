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
    private var collectedNumber : (number: Double,symbol : String?)?
    
    mutating func setNumber(_ number : Double)
    {
        newNumber = number
    }
    
    
    mutating func calculate(with input: String) ->
    Double?    {
        if let n = newNumber {
            
            
            switch input {
            case "AC":
                collectedNumber =  nil
                return 0
            case "+/-":
                return n * -1
            case "%":
                return n * 0.01
            case "=":
                return doCalculation(n)
               
            default:
                if collectedNumber != nil && collectedNumber?.symbol == nil
                {
                    print("Symbol is nill")
                    collectedNumber = (collectedNumber!.number, input)
                   return doCalculation(n)
                }
                else if  collectedNumber?.number != nil && collectedNumber?.symbol != nil{
                    print("Nothing is nil")
                    return doCalculation(n)
                }
                else {
                    print("Collected number is nil")
                    collectedNumber = (n, input)
                }
                
                
                
                
                
            }
            
            return nil
            
        }
        
        
        return nil
        
        
        
    }
    

   mutating func doCalculation(_ number: Double) -> Double?
    {
        if let firstNumber = collectedNumber?.number, let symbol = collectedNumber?.symbol {
            switch symbol {
            case "+":
                collectedNumber?.symbol = nil
                collectedNumber?.number = firstNumber + number
                return firstNumber + number
            case "-":
                print("-")
                collectedNumber?.symbol = nil
                collectedNumber?.number = firstNumber - number
                return firstNumber - number
                case "×":
                collectedNumber?.symbol = nil
                collectedNumber?.number = firstNumber * number
                return firstNumber * number
                case "÷":
                collectedNumber?.symbol = nil
                collectedNumber?.number = firstNumber / number
                return firstNumber / number
            default:
                print("There is no valid input")
            }
        }
        return nil
    }
}
