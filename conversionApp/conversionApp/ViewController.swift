//
//  ViewController.swift
//  conversionApp
//
//  Created by Tess Shapiro on 10/21/15.
//  Copyright © 2015 Tess Shapiro. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    let conversions = [
        FtoC(),
        FtToMe()
    ]
    
//    MARK: - UIPickerView
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.conversions.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.conversions[row].userFriendlyMessage()
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.currentConversion = self.conversions[row]
        self.computeConversion()
    }
    
    
    //    IB vars
    @IBOutlet weak var inputLabel: UILabel!
    @IBOutlet weak var outputLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    
    @IBAction func onButtonTapped(sender: UIButton) {
        if 1 <= sender.tag && sender.tag <= 9 {
            self.userTappedDigit(sender.tag)
        } else if sender.tag == 10 {
//            clear
            self.userTappedClear()
        } else if sender.tag == 11 {
//            zero
            self.userTappedDigit(0)
        } else if sender.tag == 12 {
//            dot
            self.userTappedDot()
        }
    }
    
    
    var input :String = ""
    
    func userTappedDigit(digit: Int) {
        self.input += String(digit)
        self.update()
    }
    func userTappedClear() {
        self.input = ""
        self.update()
    }
    func userTappedDot() {
        self.input += "."
        self.update()
    }
    func update() {
        self.updateInputLabel()
        self.computeConversion()
        
    }
    func updateInputLabel() {
        self.inputLabel.text = self.input
    }
    
    var currentConversion : Conversion = FtoC()
    
    func computeConversion() {
        if let valueToBeConverted = Double(self.input) {
            let convertedValue = self.currentConversion.convert(valueToBeConverted)
            self.outputLabel.text = String(convertedValue)
        }
    }
    
    
    
    
}

