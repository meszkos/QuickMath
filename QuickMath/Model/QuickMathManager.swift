//
//  QuickMathManager.swift
//  QuickMath
//
//  Created by MacOS on 10/03/2022.
//

import Foundation
import QuartzCore


struct Manager{
    
    let userDefaults = UserDefaults()
    var equasionArray = ["+","-","x","/","**"]
    
    
    var arrayIndex = 0
    var n1 = 0
    var n2 = 0
    var correctResult = ""
    
    mutating func provideEquasion(operation: String, currentScore: Int){
        
        switch operation {
        case "+":
            if currentScore < 10{
                n1 = Int.random(in: 1...100)
                n2 = Int.random(in: 1...100)
            }else if currentScore < 20{
                n1 = Int.random(in: 1...500)
                n2 = Int.random(in: 1...150)
            }else if currentScore < 30{
                n1 = Int.random(in: 1...500)
                n2 = Int.random(in: 1...500)
            }
            
            
            correctResult = String(n1 + n2)
        case "-":
            if currentScore < 10{
                n1 = Int.random(in: 1...100)
                n2 = Int.random(in: 1...100)
            }else if currentScore < 20{
                n1 = Int.random(in: 1...500)
                n2 = Int.random(in: 1...100)
            }else if currentScore < 30{
                n1 = Int.random(in: 1...500)
                n2 = Int.random(in: 1...500)
            }
            
            correctResult = String(n1 - n2)
            
        case "x":
            if currentScore < 10{
                n1 = Int.random(in: 1...50)
                n2 = Int.random(in: 1...100)
            }else if currentScore < 20{
                n1 = Int.random(in: 1...100)
                n2 = Int.random(in: 1...100)
            }else if currentScore < 30{
                n1 = Int.random(in: 1...150)
                n2 = Int.random(in: 1...100)
            }
            
            correctResult = String(n1 * n2)
            
        case "/":
            if currentScore < 10{
                n1 = Int.random(in: 1...50)
                n2 = Int.random(in: 1...100)
            }else if currentScore < 20{
                n1 = Int.random(in: 1...100)
                n2 = Int.random(in: 1...100)
            }else if currentScore < 30{
                n1 = Int.random(in: 1...150)
                n2 = Int.random(in: 1...100)
            }
            n1 = n1 * n2
            
            let result = String(n1 / n2)
            correctResult = String(result)
            
        case "**":
            if currentScore < 10{
                n1 = Int.random(in: 1...20)
                n2 = Int.random(in: 2...3)
            }else if currentScore < 20{
                n1 = Int.random(in: 1...100)
                n2 = Int.random(in: 2...3)
            }else if currentScore < 30{
                n1 = Int.random(in: 1...100)
                n2 = Int.random(in: 2...3)
            }
            
            if n2 == 2{
                correctResult = String(n1 * n1)
            }else{
                correctResult = String(n1 * n1 * n1)
            }
        case "+ - x / *2":
            arrayIndex = Int.random(in: 0...4)
            
            provideEquasion(operation: equasionArray[arrayIndex],currentScore: currentScore)
            
        default:
            return
        }
    }
    
    func checkTimeLimit(operation: String) -> String{
        
        switch operation {
        case "+":
            return "10"
        case "-":
            return "10"
        case "x":
            return "10"
        case "/":
            return "15"
        case "**":
            return "15"
        case "+ - x / *2":
            return "15"
        default:
            return "0"
        }
    }
    
    func setDefaultBestScore(){
    // Prevents crash when playing for the first time
        
        if userDefaults.value(forKey: "+") == nil{
            userDefaults.setValue(0, forKey: "+")
        }
        if userDefaults.value(forKey: "-") == nil{
            userDefaults.setValue(0, forKey: "-")
        }
        if userDefaults.value(forKey: "x") == nil{
            userDefaults.setValue(0, forKey: "x")
        }
        if userDefaults.value(forKey: "/") == nil{
            userDefaults.setValue(0, forKey: "/")
        }
        if userDefaults.value(forKey: "**") == nil{
            userDefaults.setValue(0, forKey: "**")
        }
        if userDefaults.value(forKey: "+ - x / *2") == nil{
            userDefaults.setValue(0, forKey: "+ - x / *2")
        }
        
    }
    
    
    
    
    
}


