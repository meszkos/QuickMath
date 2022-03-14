//
//  QuickMathManager.swift
//  QuickMath
//
//  Created by MacOS on 10/03/2022.
//

import Foundation


struct Manager{
    
    var equasionArray = ["+","-","x","/","**"]
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
            n1 = Int.random(in: 1...10)
            n2 = Int.random(in: 1...10)
            
            correctResult = String(n1 * n2)
        case "/":
            n1 = Int.random(in: 1...100)
            n2 = Int.random(in: 1...10)
            
            correctResult = String(n1 / n2)
        case "**":
            n1 = Int.random(in: 1...10)
            n2 = Int.random(in: 2...3)
            
            if n2 == 2{
                correctResult = String(n1 * n1)
            }else{
                correctResult = String(n1 * n1 * n1)
            }
        case "+ - x / *2":
            arrayIndex = Int.random(in: 0...4)
            print(arrayIndex)
            print(equasionArray.count)
            provideEquasion(operation: equasionArray[arrayIndex])
            
        default:
            return
        }
    }
    
    func checkTimeLimit(operation: String) -> String{
        
        switch operation {
        case "+":
            return "8"
        case "-":
            return "10"
        case "x":
            return "10"
        case "/":
            return "10"
        case "**":
            return "15"
        case "+ - x / *2":
            return "15"
        default:
            return "0"
        }
    }
    
}


