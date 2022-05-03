//
//  WelcomeScreenManager.swift
//  QuickMath
//
//  Created by MacOS on 03/05/2022.
//

import Foundation

class WelcomeScreenManager{
    
    func isFirstLaunch() -> Bool{
        //check if app is launched for the first time
        if !UserDefaults.standard.bool(forKey: "HasLaunched"){
            UserDefaults.standard.set(true, forKey: "HasLaunched")
            UserDefaults.standard.synchronize()
            
            return true
        }else{
            
            return false
        }
        
        
    }
    
}
