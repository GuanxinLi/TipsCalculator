//
//  ViewController.swift
//  Tips
//
//  Created by Guanxin Li on 12/27/17.
//  Copyright © 2017 Guanxin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var total = 0.0
    var pplNum = 1
    @IBOutlet weak var TipsPic: UIImageView!
    @IBOutlet weak var pplLabel: UILabel!
    
    @IBOutlet weak var splitAmountLabel: UILabel!
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
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
    
   
    @IBAction func calculateTip(_ sender: Any){
        let tipPercentages = [0.15,0.18,0.20]
        let bill = Double(billField.text!) ?? 0
        let tip = bill*tipPercentages[tipControl.selectedSegmentIndex]
        total = bill+tip
        tipLabel.text = String(format: "+$%.2f",tip)
        totalLabel.text = String(format: "$%.2f",total)
        splitAmountLabel.text = String(format: "$%.2f",total/Double(pplNum))
    }
    @IBAction func slider(_ sender: UISlider){
        pplNum = Int(sender.value)
        pplLabel.text = String(pplNum)
        let splitAmount = Double((Int(total*100)/Int((sender.value))))/100.0
        print(splitAmount)
        splitAmountLabel.text = String(format: "$%.2f",splitAmount)
    }
}

