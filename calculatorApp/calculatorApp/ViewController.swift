//
//  ViewController.swift
//  calculatorApp
//
//  Created by Tess Shapiro on 10/24/15.
//  Copyright © 2015 Tess Shapiro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//    UI elements
    @IBOutlet weak var inputLabel: UITextField!
    var currentNumber : String = ""
    
//    "Data model"
    var firstArgument = Float()
    var secondArgument = Float()
    var result : Float = 0
    var currentOperator: String = "+"
    
//    booleans that track app states
    var firstArgumentInput = false
    var secondArgumentInput = false
    var decimalPlaceInCurrentNum = false
    
//   helper funcs
    func updateInputLabel() {
        self.inputLabel.text = self.currentNumber
        printVars()
    }
    
    func doAddition(first:Float, second:Float) {
        self.result = first + second
    }
    
    func doSubtraction(first:Float, second:Float) {
        self.result = first - second
    }
    
    func doMultiplication(first:Float, second:Float) {
        self.result = first * second
    }
    
    func doDivision(first:Float, second:Float) {
        self.result = first / second
    }
    
    func percent(currentNum: Float) -> Float {
        return currentNum * 0.01
    }
    
    func assignNumbers() {
//      assigning first number
        if !firstArgumentInput {
            if let _firstArgument = Float(self.currentNumber) {
                self.firstArgument = _firstArgument
                self.firstArgumentInput = true
            }
//      assigning second number
        } else if !self.secondArgumentInput {
            if let _secondArgument = Float(self.currentNumber) {
                self.secondArgument = _secondArgument
                self.secondArgumentInput = true
            }
        }
    }
    
// re-assigning numbers for next turn
    func reassignForNext() {
        self.firstArgument = self.result
        self.secondArgumentInput = false
        self.decimalPlaceInCurrentNum = false
        
        self.currentNumber = "\(self.result)"
        updateInputLabel()
        self.currentNumber = ""
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        inputLabel.text = "0"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
//    IBAction functions
    
//    func called when nums 0-9 pushed - using tag id (equal to value) to create string
    @IBAction func numberPushed(sender: UIButton) {
        if sender.tag == 10 {
            self.currentNumber = self.currentNumber + "0"
        } else {
            self.currentNumber = self.currentNumber + String(sender.tag)
        }
        updateInputLabel()
    }
    
//    decimal point
    @IBAction func decimalPoint(sender: UIButton) {
        if !self.decimalPlaceInCurrentNum {
            self.decimalPlaceInCurrentNum = true
            self.currentNumber = self.currentNumber + "."
            updateInputLabel()
        } else {
            return
        }
        
    }

//    +/-
    @IBAction func positiveNegativePushed(sender: UIButton) {
        
        if !self.firstArgumentInput {
            if let _firstArgument = Float(self.currentNumber) {
                self.firstArgument = _firstArgument * -1
                self.currentNumber = String(self.firstArgument)
            }
        } else {
            self.currentNumber = self.inputLabel.text!
            if let _secondArgument = Float(self.currentNumber) {
                self.secondArgument = _secondArgument * -1
                print("asdf")
                self.currentNumber = String(self.secondArgument)
            }
        }
        updateInputLabel()
    }
    
//    %
    @IBAction func percentPushed(sender: UIButton) {
        if !self.firstArgumentInput {
            if let _firstArgument = Float(self.currentNumber) {
                self.firstArgument = _firstArgument * 0.01
                self.currentNumber = String(self.firstArgument)
            }
        } else {
            self.currentNumber = self.inputLabel.text!
            if let _secondArgument = Float(self.currentNumber) {
                self.secondArgument = _secondArgument * 0.01
                self.currentNumber = String(self.secondArgument)
            }
        }
        updateInputLabel()
    }
    
    @IBAction func operatorPushed(sender: UIButton) {
        assignNumbers()
        
//      assigning operator
        switch sender.tag {
            case 14:
                self.currentOperator = "+"
                doAddition(self.firstArgument, second:self.secondArgument)
            case 15:
                self.currentOperator = "-"
                doSubtraction(self.firstArgument, second: self.secondArgument)
            case 16:
                self.currentOperator = "*"
                doMultiplication(self.firstArgument, second: self.secondArgument)
            case 17:
                self.currentOperator = "/"
                doDivision(self.firstArgument, second: self.secondArgument)
            default:
                print("error")
        }
        reassignForNext()
    }
    
    @IBAction func equalsPushed(sender: UIButton) {
        assignNumbers()

        switch self.currentOperator {
            case "+":
                doAddition(self.firstArgument, second:self.secondArgument)
            case "-":
                doSubtraction(self.firstArgument, second: self.secondArgument)
            case "*":
                doMultiplication(self.firstArgument, second: self.secondArgument)
            case "/":
                doDivision(self.firstArgument, second: self.secondArgument)
            default:
                print("error")
        }
        
        reassignForNext()
    }
    @IBAction func clearButton(sender: UIButton) {

//      clear button
        self.decimalPlaceInCurrentNum = false
        self.currentNumber = ""
        if !self.secondArgumentInput {
            self.firstArgument = 0
            self.firstArgumentInput = false
        }
//      all clear button
        if sender.tag == 19 {
            self.result = 0
            self.firstArgument = 0
            self.secondArgument = 0
            self.firstArgumentInput = false
            self.secondArgumentInput = false
        }
        updateInputLabel();
    }
    
    
    
    func printVars() {
        print("result:  \(self.result)")
        print("first argument:  \(self.firstArgument)")
        print("second argument:  \(self.secondArgument)")
        print("current operator \(self.currentOperator)")
        print("first argument bool: \(firstArgumentInput)")
        print("second argument bool: \(secondArgumentInput)")
    }
}







