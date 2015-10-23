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
        clearTextIfNeeded();
        let newText = "\(mainTextView.text!)\(stringToAppend)";
        mainTextView.text = newText;
    }
    
    func appendOperationString(stringToAppend: String) {
        let newText = "\(mainTextView.text!) \(stringToAppend) ";
        mainTextView.text = newText;
    }
    
    func clearTextIfNeeded() {
        if shouldClearOnNextTap {
            mainTextView.text = "";
            shouldClearOnNextTap = false;
        }
    }
    
    // IBAction
    
    @IBAction func touchedNumberButton(sender: UIButton) {
        let currentString = mainTextView.text;
        if hasFactorialInInput(currentString) {
            return;
        }
        
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
        let currentString = mainTextView.text;
        if hasOperatorInInput(currentString) {
            return;
        }
        
        let newFunctionString = sender.titleLabel!.text!;
        if functionInInputMatchesNewFunction(currentString, newFunction: newFunctionString) {
            appendOperationString(newFunctionString);
        }
    }
    
    
    @IBAction func touchedEqualsButton(sender: UIButton) {
        let currentString = mainTextView.text;
        let result = solveEquation(currentString);
        appendOperationString(sender.titleLabel!.text!);
        appendNumberString(result);
        shouldClearOnNextTap = true;
    }

}

