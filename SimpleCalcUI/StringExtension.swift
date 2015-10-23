//
//  StringExtension.swift
//  SimpleCalcUI
//
//  Created by Jacob Alewel on 10/22/15.
//  Copyright © 2015 Jacob Alewel. All rights reserved.
//

import Foundation

extension String {
    func stringBySingleSpacingAllWhiteSpace() -> String {
        var trimmedOutput = self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet());
        while (trimmedOutput.containsString("  ")) {
            trimmedOutput = trimmedOutput.stringByReplacingOccurrencesOfString("  ", withString: " ");
        }
        return trimmedOutput;
    }
}