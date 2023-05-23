//
//  WelcomeViewController.swift
//  TelegraphChat
//
//  Created by Berat Ridvan Asilturk 23/05/2023.
//
import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        titleLabel.text = ""
        var chracterIndex = 0.0
        let titleText = "⚡️TelegraphChat"
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.5 * chracterIndex, repeats: false) { (timer) in
                self.titleLabel.text?.append(letter)
            }
            chracterIndex += 1
        }
       
    }
}
        
