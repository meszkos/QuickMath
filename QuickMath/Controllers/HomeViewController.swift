//
//  HomeViewController.swift
//  QuickMath
//
//  Created by MacOS on 10/03/2022.
//

import UIKit

class HomeViewController: UIViewController, SettingsDelegate {
    

    @IBOutlet weak var commaButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
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
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var stageLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    let settingsController = SettingsViewController()
    var answer: String = ""
    var operation: String = "+"
    var manager = Manager()
    
    var timer = Timer()
    var time = 0.0
    
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
            if answer.prefix(1) == "0"{
                answer = ""
                resultLabel.text = ""
            }
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
        if sender.restorationIdentifier == "delete"{
            if answer.count != 0{
                answer.removeLast()
                resultLabel.text?.removeLast()
            }
            if answer.count == 0 {
                resultLabel.text = "0"
                answer = "0"
            }
        }
        if sender.titleLabel?.text == "Start"{
            answer = "0"
            resultLabel.text = "0"
            resultLabel.textColor = UIColor.white
            timeLabel.textColor = UIColor.white
            
            startButton.setTitle("Check", for: .normal)
            manager.provideEquasion(operation: operation)
            
           
            if operation == "+ - x / *2"{
                DispatchQueue.main.async {
                    self.questionLabel.text = "\(self.manager.n1) \(self.manager.equasionArray[self.manager.arrayIndex]) \(self.manager.n2) ="
                }
            }
            questionLabel.text = "\(manager.n1) \(operation) \(manager.n2) ="
            
            
            startTimer()
        }
        if sender.titleLabel?.text == "Check"{
            timer.invalidate()
            let timeLimit = manager.checkTimeLimit(operation: operation)
            
            if manager.correctResult == answer && time < Double(timeLimit)!{
                resultLabel.textColor = UIColor.systemGreen
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    self.startTimer()
                    self.resultLabel.textColor = UIColor.white
                    self.answer = "0"
                    self.resultLabel.text = "0"
                    
                    self.manager.provideEquasion(operation: self.operation)
                    
                    DispatchQueue.main.async {
                        if self.operation == "+ - x / *2"{
                            self.questionLabel.text = "\(self.manager.n1) \(self.manager.equasionArray[self.manager.arrayIndex]) \(self.manager.n2) ="
                        }
                    }
                    
                    self.questionLabel.text = "\(self.manager.n1) \(self.operation) \(self.manager.n2) ="
                }
            }
            if manager.correctResult != answer{
                
                resultLabel.textColor = UIColor.systemRed
                startButton.setTitle("Start", for: .normal)
            }
            if time > Double(timeLimit)!{
                
                timeLabel.textColor = UIColor.systemRed
                startButton.setTitle("Start", for: .normal)
            }
        }
        
    }
    
    func pickOperation(pickedOperation: String) {
        operation = pickedOperation
        
        
        questionLabel.text = "Click start"
        timeLabel.textColor = UIColor.white
        resultLabel.textColor = UIColor.white
        
        startButton.setTitle("Start", for: .normal)
        answer = "0"
        resultLabel.text = "0"
        
    }
    
    
//MARK: - Seque 
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        time = 0.0
        timer.invalidate()
        
        if segue.identifier == "goToSettings"{
            let destinacionVC = segue.destination as! SettingsViewController
            destinacionVC.delegate = self
        }
        
    }

    
    
    

//MARK: - Timer methods
    func startTimer(){
        timer.invalidate()
        time = 0.0
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        
    }
    
    @objc func timerAction() {
        
        time += 0.1
        timeLabel.text = "\(String(format: "%.1f", time))s"
        }
    
    
    
//MARK: - UI Methods
    
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
        deleteButton.layer.cornerRadius = 20
        startButton.layer.cornerRadius = 20
        commaButton.layer.cornerRadius = 20
        minusButton.layer.cornerRadius = 20
    }
    
    
}
