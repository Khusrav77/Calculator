//
//  ViewModel.swift
//  Calculator
//
//  Created by Khusrav Safiev on 8/6/24.
//

import SwiftUI

class ViewModel: ObservableObject {
    
    // MARK: Properties
    @Published var value = "0"
    @Published var number: Double = 0.0
    @Published var currentOperetion: Operation = .none
    
    let buttonsArray: [[Buttons]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiple],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .decimal, .equal]
    ]
    
    // MARK: Tap Button Method
    func didTap(item: Buttons) {
        switch item {
            
        case .plus, .minus, .multiple, .divide:
            currentOperetion = item.buttonsToOperetion()
            number = Double(value) ?? 0
            value = "0"
            
        case .equal:
            if let currentValue = Double(value) {
                value = formatResult(performOperation(currentValue))
            }
            
        case .decimal:
            if !value.contains(".") {
                value += "."
            }
            
        case .percent:
            if let currentValue = Double(value) {
                value = formatResult(currentValue / 100)
            }
        case .negative:
            if let currentValue = Double(value) {
                value = formatResult(-currentValue)
            }
        case .clear:
            value = "0"
            
        default:
            if value == "0" {
                value = item.rawValue
            } else {
                value += item.rawValue
            }
        }
    }
        
        // MARK: - Heleper Calculate Method
        func performOperation(_ currentValue: Double) -> Double {
            switch currentOperetion {
                
            case .addition:
                return number + currentValue
            case .subtract:
                return number - currentValue
            case .multiply:
                return number * currentValue
            case .divide:
                return number / currentValue
            case .none:
                return currentValue
            }
        }
        
        func formatResult(_ result: Double) -> String {
            return String(format: "%g", result)
        }
        
        // MARK: - Size Buttons
        func buttonwidth(item: Buttons) -> CGFloat {
            let spacing: CGFloat = 12
            let totalSpacing: CGFloat = 5 * spacing
            let zeroSpacing: CGFloat = 4 * spacing
            let totalColums: CGFloat = 4
            let scrinWidth = UIScreen.main.bounds.width
            
            if item == .zero {
                return (scrinWidth - zeroSpacing) / totalColums * 2
            }
            return (scrinWidth - totalSpacing) / totalColums
        }
        
        
        func buttonHeidht() -> CGFloat {
            let spacing: CGFloat = 12
            let totalSpacing: CGFloat = 6 * spacing
            let totalColums: CGFloat = 4
            let scrinWidth = UIScreen.main.bounds.width
            
            return (scrinWidth - totalSpacing) / totalColums
        }
    }

