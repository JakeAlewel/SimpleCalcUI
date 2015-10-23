//
//  Calculator.swift
//  SimpleCalcUI
//
//  Created by Jacob Alewel on 10/22/15.
//  Copyright © 2015 Jacob Alewel. All rights reserved.
//

import Foundation

// Business Logic - Public

func solveEquation(input: String) -> String {
    let components = inputComponents(input);
    if hasFactorialInComponents(components) {
        return computeFactorial(components[0]);
    } else if hasFunctionInComponents(components) {
        return computeFunction(components);
    } else if hasOperatorInComponents(components) {
        return computeOperator(components);
    } else {
        return "ERROR";
    }
}

// Business Logic - Private

private func convert(incoming: String) -> Double? {
    let numberFromString = NSNumberFormatter().numberFromString(incoming);
    if numberFromString == nil {
        return nil;
    } else {
        return numberFromString?.doubleValue;
    }
}

private func computeFactorial(stringToCompute: String) -> String {
    let number = convert(stringToCompute);
    if number != nil {
        let roundedNumber = Int(round(number!));
        if roundedNumber < 0 {
            return "ERROR";
        } else if roundedNumber == 0 {
            return "1";
        } else {
            var factorial = 1;
            for index in 1...roundedNumber {
                factorial *= index;
            }
            return "\(factorial)";
        }
    }
    return "ERROR";
}

private func computeFunction(components: [String]) -> String {
    let functionName = firstFunctionInComponents(components);
    if functionName != nil {
        let arrayOfNums = arrayOfNumbersWithoutFunctions(components, functionName: functionName!);
        if functionName!.containsString("Cnt") {
            return "\(arrayOfNums.count)";
        } else if functionName!.containsString("Avg") {
            let sumOfNums = sumFromNumberArray(arrayOfNums);
            let average = sumOfNums / Double(arrayOfNums.count);

            return "\(average)";
        } else {
            return "ERROR";
        }
    }
    return "ERROR";
}

private func arrayOfNumbersWithoutFunctions(components: [String], functionName: String) -> [Double] {
    var arrayOfNums: [Double] = [];
    
    for (var index = components.count - 1; index >= 0; index--) {
        let valueAtIndex = components[index];
        if !valueAtIndex.containsString(functionName) {
            let convertedValue = convert(valueAtIndex);
            if convertedValue != nil {
                arrayOfNums.append(convert(valueAtIndex)!);
            }
        }
    }
    
    return arrayOfNums;
}

private func sumFromNumberArray(numbers: [Double]) -> Double {
    var sum: Double = 0.0;
    for number in numbers {
        sum += number;
    }
    return sum;
}

private func computeOperator(components: [String]) -> String {
    if components.count == 3 {
        let operatorString = components[1];
        let firstValue = convert(components[0]);
        let secondValue = convert(components[2]);
        if firstValue != nil && secondValue != nil {
        switch operatorString {
            case "+":
                return "\(firstValue! + secondValue!)";
            case "-":
                return "\(firstValue! - secondValue!)";
            case "*":
                return "\(firstValue! * secondValue!)";
            case "/":
                return "\(firstValue! / secondValue!)";
            case "%":
                return "\(firstValue! % secondValue!)";
            default:
                return "ERROR";
            }
        }
    }
    return "ERROR";
}

// Validation - Public

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
        return canAddAnotherFunctionToComponents(components, newFunction: newFunction);
    } else {
        return true;
    }
}

// Validation - Private

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
    let foundFunction = firstFunctionInComponents(components);
    return foundFunction != nil;
}

private func hasFactorialInComponents(components: [String]) -> Bool {
    for string in components {
        if string.containsString("Fact") {
            return true;
        }
    }
    return false;
}

private func canAddAnotherFunctionToComponents(components: [String], newFunction: String) -> Bool {
    let functionAlreadyExistsInInput = functionExistsInComponents(newFunction, components: components);
    if functionAlreadyExistsInInput {
        return !components.last!.containsString(newFunction)
    } else {
        return false;
    }
}

// Function Helpers - Private

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

private func firstFunctionInComponents(components: [String]) -> String? {
    for string in components {
        if validFunctionStringFromString(string) != nil {
            return string;
        }
    }
    return nil;
}

// Utility - Private

private func inputComponents(input: String) -> [String] {
    let trimmedInput = input.stringBySingleSpacingAllWhiteSpace();
    if trimmedInput.isEmpty {
        return [];
    }
    
    return trimmedInput.componentsSeparatedByString(" ");
}
