//
//  ViewController.swift
//  SimpleCalcUI
//
//  Created by Jacob Alewel on 10/20/15.
//  Copyright © 2015 Jacob Alewel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let operatorInputs = ["+", "-", "*", "/", "%"];
    let functionInputs = ["Cnt", "Avg", "Fact"];
    
    @IBOutlet weak var mainTextView: UITextView!;
    var shouldClearOnNextTap : Bool = false;
    
    // Update Text View
    
    func appendNumberString(stringToAppend: String) {
        let newText = "\(mainTextView.text!)\(stringToAppend)";
        mainTextView.text = newText;
    }
    
    func appendFunctionString(stringToAppend: String) {
        let newText = "\(mainTextView.text!) \(stringToAppend) ";
        mainTextView.text = newText;
    }
    
    // IBAction
    
    @IBAction func touchedNumberButton(sender: UIButton) {
        appendNumberString(sender.titleLabel!.text!);
    }
    
    @IBAction func touchedOperatorButton(sender: UIButton) {
        appendFunctionString(sender.titleLabel!.text!);
    }
    
    
    @IBAction func touchedFunctionButton(sender: UIButton) {
        appendFunctionString(sender.titleLabel!.text!);
    }
    
    
    @IBAction func touchedEqualsButton(sender: UIButton) {
        let result = solveEquation();
        appendFunctionString(sender.titleLabel!.text!);
        appendNumberString(result);
    }
    
    // Business Logic
    
    func solveEquation() -> String {
        let components = inputComponents();
        print(components);
        return "Huuzahhh"
    }
    
    func hasOperatorInInput() -> Bool {
        let components = inputComponents();
        for string in components {
            for operatorString in operatorInputs {
                if string.containsString(operatorString) {
                    return true;
                }
            }
        }
        return false;
    }
    
    func inputComponents() -> [String] {
        let string = mainTextView.text!;
        return string.componentsSeparatedByString(string);
    }
    
}

