//
//  ViewController.swift
//  Tipsy
//
//  Created by Lidiane Ferreira on 24/06/2019.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var tip = 00
    var split = 2
    var result = "0.0"
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = result
        settingsLabel.text = "Dividido entre \(split) pessoas, com \(tip)% de gorjeta."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}


