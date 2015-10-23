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
    print(components);
    return "Huuzahhh"
}

// Verification

let operatorInputs = ["+", "-", "*", "/", "%"];
let functionInputs = ["Cnt", "Avg", "Fact"];

func hasOperatorInInput(input: String) -> Bool {
    let components = inputComponents(input);
    print(components);
    for string in components {
        for operatorString in operatorInputs {
            if string.containsString(operatorString) {
                return true;
            }
        }
    }
    return false;
}

func hasFunctionInInput(input: String) -> Bool {
    let components = inputComponents(input);
    for string in components {
        if validFunctionStringFromString(string) != nil {
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

func functionInInputMatchesNewFunction(input: String, newFunction: String) -> Bool {
    if hasFunctionInInput(input) {
        let components = inputComponents(input);
        for string in components {
            let inputFunctionString = validFunctionStringFromString(string);
            if inputFunctionString != nil {
                if !inputFunctionString!.containsString(newFunction) {
                    return false;
                }
            }
        }
        return true;
    } else {
        return true;
    }
}

func hasFactorialInInput(input: String) -> Bool {
    let components = inputComponents(input);
    for string in components {
        if string.containsString("Fact") {
            return true;
        }
    }
    return false;
}

func inputComponents(input: String) -> [String] {
    return input.componentsSeparatedByString(" ");
}