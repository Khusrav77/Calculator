//
//  Extension.swift
//  Calculator
//
//  Created by Khusrav Safiev on 8/5/24.
//

import SwiftUI

extension Buttons {
    func buttonsToOperetion() -> Operation {
        switch self {
        case .plus:
            return .addition
       
        case .minus:
            return .subtract
           
        case .multiple:
            return .multiply
            
        case .divide:
            return .divide
            
        default:
            return .none
        }
    }
}
