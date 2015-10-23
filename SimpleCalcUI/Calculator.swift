//
//  Calculator.swift
//  SimpleCalcUI
//
//  Created by Jacob Alewel on 10/22/15.
//  Copyright © 2015 Jacob Alewel. All rights reserved.
//

import Foundation

// Business Logic

func solveEquation(input: String) -> String {
    let components = inputComponents(input);
    if hasFactorialInInput(input) {
        
    }
    print(components);
    return "Huuzahhh"
}

// Verification - Public 

func hasNoInputValues(input: String) -> Bool {
    return inputComponents(input).count <= 0;
}

func hasOperatorInInput(input: String) -> Bool {
    let components = inputComponents(input);
    return hasOperatorInComponents(components);
}

func hasFunctionInInput(input: String) -> Bool {
    let components = inputComponents(input);
    return hasFunctionInComponents(components);
}

func hasFactorialInInput(input: String) -> Bool {
    let components = inputComponents(input);
    return hasFactorialInComponents(components);
}

func canAddNewFunctionToInput(input: String, newFunction: String) -> Bool {
    if hasFunctionInInput(input) {
        let components = inputComponents(input);
        let functionAlreadyExistsInInput = functionExistsInComponents(newFunction, components: components);
        if functionAlreadyExistsInInput {
            return !newFunction.containsString("Fact");
        } else {
            return false;
        }
    } else {
        return true;
    }
}

// Verification - Private

private let operatorInputs = ["+", "-", "*", "/", "%"];
private let functionInputs = ["Cnt", "Avg", "Fact"];

private func hasOperatorInComponents(components: [String]) -> Bool {
    for string in components {
        for operatorString in operatorInputs {
            if string.containsString(operatorString) {
                return true;
            }
        }
    }
    return false;
}

private func hasFunctionInComponents(components: [String]) -> Bool {
    for string in components {
        if validFunctionStringFromString(string) != nil {
            return true;
        }
    }
    return false;
}

private func hasFactorialInComponents(components: [String]) -> Bool {
    for string in components {
        if string.containsString("Fact") {
            return true;
        }
    }
    return false;
}

private func validFunctionStringFromString(inputSubString: String) -> String? {
    for functionString in functionInputs {
        if inputSubString.containsString(functionString) {
            return functionString;
        }
    }
    return nil;
}

private func functionExistsInComponents(newFunction: String, components: [String]) -> Bool {
    for string in components {
        let inputFunctionString = validFunctionStringFromString(string);
        if inputFunctionString != nil {
            if !inputFunctionString!.containsString(newFunction) {
                return false;
            }
        }
    }
    return true;
}

// Utility - Private

private func inputComponents(input: String) -> [String] {
    let trimmedInput = input.stringBySingleSpacingAllWhiteSpace();
    if trimmedInput.isEmpty {
        return [];
    }
    
    return trimmedInput.componentsSeparatedByString(" ");
}
