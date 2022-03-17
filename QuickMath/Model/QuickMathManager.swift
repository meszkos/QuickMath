//
//  QuickMathManager.swift
//  QuickMath
//
//  Created by MacOS on 10/03/2022.
//

import Foundation


struct Manager{
    
    let userDefaults = UserDefaults()
    var equasionArray = ["+","-","x","/","**"]
    var devideNumbers = [""]
    
    var arrayIndex = 0
    var n1 = 0
    var n2 = 0
    var correctResult = ""
    
    mutating func provideEquasion(operation: String){
        
        switch operation {
        case "+":
            n1 = Int.random(in: 1...100)
            n2 = Int.random(in: 1...100)
            
            correctResult = String(n1 + n2)
        case "-":
            n1 = Int.random(in: 1...100)
            n2 = Int.random(in: 1...100)
            
            correctResult = String(n1 - n2)
            
        case "x":
            n1 = Int.random(in: 1...100)
            n2 = Int.random(in: 1...50)
            
            correctResult = String(n1 * n2)
        case "/":
            n1 = Int.random(in: 1...50)
            n2 = Int.random(in: 1...50)
            
            n1 = n1 * n2
            
            let result = String(n1 / n2)
            correctResult = String(result)
            print(correctResult)
        case "**":
            n1 = Int.random(in: 1...100)
            n2 = Int.random(in: 2...3)
            
            if n2 == 2{
                correctResult = String(n1 * n1)
            }else{
                correctResult = String(n1 * n1 * n1)
            }
        case "+ - x / *2":
            arrayIndex = Int.random(in: 0...4)
            
            provideEquasion(operation: equasionArray[arrayIndex])
            
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


