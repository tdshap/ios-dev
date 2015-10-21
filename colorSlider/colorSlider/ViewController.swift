//
//  ViewController.swift
//  colorSlider
//
//  Created by Tess Shapiro on 10/5/15.
//  Copyright © 2015 Tess Shapiro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//class properties
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var hueLabel: UILabel!
    @IBOutlet weak var brightnessLabel: UILabel!
    @IBOutlet weak var saturationLabel: UILabel!
    @IBOutlet weak var savedColor: UIView!

    var hue : Float = 0.5
    var brightness : Float = 0.5
    var saturation : Float = 0.5

    var newHue : Float = 0.5
    var newBrightness : Float = 0.5
    var newSaturation : Float = 0.5

//slider action funcs
    @IBAction func onHueChanged(sender: UISlider) {
        self.hue = sender.value
        self.hueLabel.text = "Hue: \(self.hue)"
        self.updateColor()
    }

    @IBAction func onBrightnessChanged(sender: UISlider) {
        self.brightness = sender.value
        self.brightnessLabel.text = "Brightness \(self.brightness)"
        self.updateColor()
    }
    
    @IBAction func onSaturationChanged(sender: UISlider) {
        self.saturation = sender.value
        self.saturationLabel.text = "Saturation = \(self.saturation)"
        self.updateColor()
    }
    
//logic
    func updateColor() ->UIColor{
        let newColor = UIColor(
            hue: CGFloat(self.hue),
            saturation: CGFloat(self.saturation),
            brightness: CGFloat(self.brightness),
            alpha: 1.0
        )
        
        self.colorView.backgroundColor = newColor
        return newColor
    }
    
    @IBAction func onColorSaved(sender: UIButton) {
        newHue = hue
        newSaturation = saturation
        newBrightness = brightness
        
        self.savedColor.backgroundColor = self.updateColor()
    }
//slider outlets (text/appearance)
    @IBOutlet weak var hueSlider: UISlider!
    @IBOutlet weak var saturationSlider: UISlider!
    @IBOutlet weak var brightnessSlider: UISlider!
    
    @IBAction func onMix(sender: UIButton) {
        self.hue = (self.newHue + self.hue) / 2
        self.brightness = (self.newBrightness + self.brightness) / 2
        self.saturation = (self.newSaturation + self.saturation) / 2
        self.updateColor()
        self.updateSlider()
    }
    
    func updateSlider() {
        self.hueSlider.value = self.hue
        self.brightnessSlider.value = self.brightness
        self.saturationSlider.value = self.saturation
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.updateColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

