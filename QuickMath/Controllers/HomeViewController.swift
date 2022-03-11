//
//  HomeViewController.swift
//  QuickMath
//
//  Created by MacOS on 10/03/2022.
//

import UIKit

class HomeViewController: UIViewController, SettingsDelegate {
    

    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var acButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var stageLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    let settingsController = SettingsViewController()
    var answer: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateCornerRadius()
        
    }
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        
        //Make tap visible
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            sender.alpha = 1
        }
        if answer.count < 4 {
            answer.append(sender.titleLabel!.text!)
        }
        resultLabel.text = answer
        
        
    }
    
    @IBAction func operationButtonPressed(_ sender: UIButton) {
        
        //Make tap visible
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            sender.alpha = 1
        }
        if sender.titleLabel?.text == "AC"{
            
            answer = ""
            resultLabel.text = "0"
        }
    }
    
    func pickOperation(){
        //
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSettings"{
            let destinacionVC = segue.destination as! SettingsViewController
            destinacionVC.delegate = self
        }
    }
    
    func updateCornerRadius(){
        oneButton.layer.cornerRadius = 20
        twoButton.layer.cornerRadius = 20
        threeButton.layer.cornerRadius = 20
        fourButton.layer.cornerRadius = 20
        fiveButton.layer.cornerRadius = 20
        sixButton.layer.cornerRadius = 20
        sevenButton.layer.cornerRadius = 20
        eightButton.layer.cornerRadius = 20
        nineButton.layer.cornerRadius = 20
        zeroButton.layer.cornerRadius = 20
        acButton.layer.cornerRadius = 20
        startButton.layer.cornerRadius = 20
    }

}
