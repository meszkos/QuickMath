//
//  SettingsViewController.swift
//  QuickMath
//
//  Created by MacOS on 10/03/2022.
//

import UIKit

protocol SettingsDelegate{
    func pickOperation()
}

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var devideButton: UIButton!
    @IBOutlet weak var powerButton: UIButton!
    @IBOutlet weak var allButton: UIButton!
    
    var delegate: SettingsDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        changeButtonCorenrRadius()
    }

    @IBAction func operationPicked(_ sender: UIButton) {
        
        deselectButtons()
        sender.backgroundColor = UIColor.systemMint
        
    }
    
    
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Modfying UI
    
    func changeButtonCorenrRadius(){
        plusButton.layer.cornerRadius = 20
        minusButton.layer.cornerRadius = 20
        multiplyButton.layer.cornerRadius = 20
        devideButton.layer.cornerRadius = 20
        powerButton.layer.cornerRadius = 20
        allButton.layer.cornerRadius = 20
    }
    
    func deselectButtons(){
        plusButton.backgroundColor = UIColor.systemBlue
        minusButton.backgroundColor = UIColor.systemBlue
        multiplyButton.backgroundColor = UIColor.systemBlue
        devideButton.backgroundColor = UIColor.systemBlue
        powerButton.backgroundColor = UIColor.systemBlue
        allButton.backgroundColor = UIColor.systemBlue
    }
}
