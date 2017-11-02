//
//  ViewController.swift
//  TempConverter
//
//  Created by gil on 02/11/2017.
//  Copyright © 2017 Gilles Vanwormhoudt. All rights reserved.
//

import UIKit

enum UnitType: Int {
    case Farenheit = 0
    case Celsius = 1
}

class ViewController: UIViewController {

    @IBOutlet weak var unitSegment: UISegmentedControl!
    
    @IBOutlet weak var valueTextField: UITextField!
    
    var tempConverter = TempConverter()
    var unit:UnitType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateUnit();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clickConvert(_ sender: Any) {
        if let currentText = self.valueTextField.text {
            if let currentValue = Float(currentText) {
                let newValue = (self.unit == UnitType.Farenheit) ?
                    self.tempConverter.convertFtoC(value: currentValue) : self.tempConverter.convertCtoF(value: currentValue)
                self.valueTextField.text = String(newValue)
            }
            else {
                self.performSegue(withIdentifier: "valueErrorSegue", sender: self)
            }
        }
    }
    
    
    @IBAction func dismissHere(segue: UIStoryboardSegue) {
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "convTableSegue") {
            if let destination = segue.destination as? TableViewController {
                destination.tempConverter = self.tempConverter
                destination.unit = self.unit
            }
            
            
        }
    }
    
    @IBAction func switchUnit(sender: UISegmentedControl) {
        self.updateUnit()
    }
    
    private func updateUnit() {
        let selectedUnit = self.unitSegment.selectedSegmentIndex
        self.unit = (selectedUnit == UnitType.Farenheit.rawValue) ?
            UnitType.Farenheit : UnitType.Celsius
    }
    
}

