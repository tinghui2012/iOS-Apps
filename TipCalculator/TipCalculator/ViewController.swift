//
//  ViewController.swift
//  TipCalculator
//
//  Created by Christine Li on 4/4/20.
//  Copyright © 2020 Christine Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipPercentSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func tappedTextField(_ sender: UITextField) {
        
    }
    
    @IBAction func tappedScreen(_ sender: UITapGestureRecognizer) {
        if(self.billField.isFirstResponder) {
            self.billField.resignFirstResponder()
        }
        guard let billString = self.billField.text,
            let billAmount = Double(billString) else {
                return
        }
//        if case billField.text = billField.text {
//            bill = billField.text!
//        }
//        if(billField != nil){
//            bill = billField.text!
//        }
        let tipPercent: Double
        switch tipPercentSegmentedControl.selectedSegmentIndex {
        case 0:
            tipPercent = 0.15
        case 1:
            tipPercent = 0.18
        case 2:
            tipPercent = 0.2
        default:
            preconditionFailure("unexpected index")
        }
        var tip = tipPercent * billAmount
        tip = Double(floor(pow(10.0, 2.0) * tip)/pow(10.0, 2.0))
        var total = billAmount + tip
        total = Double(floor(pow(10.0, 2.0) * total)/pow(10.0, 2.0))
        self.tipLabel.text = String(tip)
        self.totalLabel.text = String(total)
    }
    
}

