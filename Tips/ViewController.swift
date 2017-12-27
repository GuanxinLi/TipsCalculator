//
//  ViewController.swift
//  Tips
//
//  Created by Guanxin Li on 12/27/17.
//  Copyright © 2017 Guanxin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TipsPic: UIImageView!
    @IBOutlet weak var pplLabel: UILabel!
    
    @IBAction func slider(_ sender: UISlider){
        pplLabel.text = String(Int(sender.value))
    }
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var splitAmountLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
   
    @IBAction func calculateTip(_ sender: Any) {
        let tipPercentages = [0.15,0.18,0.20]
        let bill = Double(billField.text!) ?? 0
        let tip = bill*tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill+tip
        let pplNum = Double(pplLabel.text!)
        let splitAmount = total/pplNum!
        tipLabel.text = String(format: "+$%.2f",tip)
        totalLabel.text = String(format: "$%.2f",total)
        splitAmountLabel.text = String(format: "$%.2f",splitAmount)
    }
}

