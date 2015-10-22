//
//  ViewController.swift
//  SimpleCalcUI
//
//  Created by Jacob Alewel on 10/20/15.
//  Copyright © 2015 Jacob Alewel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    
    @IBOutlet weak var mainTextView: UITextView!;
    var shouldClearOnNextTap : Bool = false;
    
    // Update Text View
    
    func appendNumberString(stringToAppend: String) {
        let newText = "\(mainTextView.text!)\(stringToAppend)";
        mainTextView.text = newText;
    }
    
    func appendOperationString(stringToAppend: String) {
        let newText = "\(mainTextView.text!) \(stringToAppend) ";
        mainTextView.text = newText;
    }
    
    // IBAction
    
    @IBAction func touchedNumberButton(sender: UIButton) {
        appendNumberString(sender.titleLabel!.text!);
    }
    
    @IBAction func touchedOperatorButton(sender: UIButton) {
        let currentString = mainTextView.text;
        if hasOperatorInInput(currentString) || hasFunctionInInput(currentString) {
            return;
        }
        appendOperationString(sender.titleLabel!.text!);
    }
    
    
    @IBAction func touchedFunctionButton(sender: UIButton) {
        appendOperationString(sender.titleLabel!.text!);
    }
    
    
    @IBAction func touchedEqualsButton(sender: UIButton) {
        let currentString = mainTextView.text;
        let result = solveEquation(currentString);
        appendOperationString(sender.titleLabel!.text!);
        appendNumberString(result);
    }
    
    // Business Logic
    
    
    
}

