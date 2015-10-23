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
        let newText = "\(mainTextView.text!.stringBySingleSpacingAllWhiteSpace()) \(stringToAppend) ";
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
        clearTextIfNeeded();
        let currentString = mainTextView.text;
        if hasFactorialInInput(currentString) {
            return;
        }
        
        appendNumberString(sender.titleLabel!.text!);
    }
    
    @IBAction func touchedOperatorButton(sender: UIButton) {
        clearTextIfNeeded();
        let currentString = mainTextView.text;
        if hasNoInputValues(currentString) || hasOperatorInInput(currentString) || hasFunctionInInput(currentString) {
            return;
        }
        
        appendOperationString(sender.titleLabel!.text!);
    }
    
    
    @IBAction func touchedFunctionButton(sender: UIButton) {
        clearTextIfNeeded();
        let currentString = mainTextView.text;
        if hasNoInputValues(currentString) || hasOperatorInInput(currentString) {
            return;
        }
        
        let newFunctionString = sender.titleLabel!.text!;
        if canAddNewFunctionToInput(currentString, newFunction: newFunctionString) {
            appendOperationString(newFunctionString);
        }
    }
    
    
    @IBAction func touchedEqualsButton(sender: UIButton) {
        clearTextIfNeeded();
        let currentString = mainTextView.text;
        if hasNoInputValues(currentString) {
            return;
        }
        
        let result = solveEquation(currentString);
        appendOperationString(sender.titleLabel!.text!);
        appendNumberString(result);
        shouldClearOnNextTap = true;
    }
    
    // View Lifecycle
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}

