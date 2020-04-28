//
//  ViewController.swift
//  Swa
//
//  Created by Kuldeep Swapnil on 27/04/20.
//  Copyright © 2020 Kuldeep Swapnil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var firstValue: String = ""
    var currentOperation: Operator = Operator.nothing
    var calcState: CalculationState = CalculationState.enteringNum
    
    @IBOutlet weak var ResultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    @IBAction func NumberClicked (_ sender: UIButton){
        updateDisplay(number: String(sender.tag))
    
    }
    func updateDisplay (number: String) {
           if calcState == CalculationState.newNumStarted {
               if let num = ResultLabel.text {
                   if num != "" {
                       firstValue = num
                   }
               }
               calcState = CalculationState.enteringNum
               ResultLabel.text = number
           }
           else if calcState == CalculationState.enteringNum {
               ResultLabel.text = ResultLabel.text! + number
           }
       }
       
    @IBAction func OpereatorClicked (_ sender: UIButton){
        calcState = CalculationState.newNumStarted
        if let num = ResultLabel.text {
            if num != "" {
                firstValue = num
                ResultLabel.text = ""
            }
        }
        
        switch sender.tag {
        case 10:
            currentOperation = Operator.add
            updateOperatorButton(tag: sender.tag)
        case 11:
            currentOperation = Operator.subtract
            updateOperatorButton(tag: sender.tag)
        case 12:
            currentOperation = Operator.times
            updateOperatorButton(tag: sender.tag)
        case 13:
            currentOperation = Operator.divide
            updateOperatorButton(tag: sender.tag)
        default:
            return
        }
    }
    func updateOperatorButton (tag: Int) {
           //clear colors
           for var i in 10..<14 {
               if let button = self.view.viewWithTag(i) as? UIButton {
                   button.backgroundColor = UIColor.clear
               }
           }
           //change color
           if let button = self.view.viewWithTag(tag) as? UIButton {
               button.backgroundColor = UIColor.yellow
           }
       }
    @IBAction func EqualClicked (_ sender: UIButton){
        calculateSum()
    }
    func calculateSum () {
        if firstValue.isEmpty {
            return
        }
        
        var result = ""
        
        if currentOperation == Operator.times {
            result = "\(Double(firstValue)! * Double(ResultLabel.text!)!)"
        } else if currentOperation == Operator.divide {
            result = "\(Double(firstValue)! / Double(ResultLabel.text!)!)"
        } else if currentOperation == Operator.subtract {
            result = "\(Double(firstValue)! - Double(ResultLabel.text!)!)"
        } else if currentOperation == Operator.add {
            result = "\(Double(firstValue)! + Double(ResultLabel.text!)!)"
        }
        
        ResultLabel.text = result
        calcState = CalculationState.newNumStarted
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

