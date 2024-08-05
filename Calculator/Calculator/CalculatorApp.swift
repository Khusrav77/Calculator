//
//  CalculatorApp.swift
//  Calculator
//
//  Created by Khusrav Safiev on 8/1/24.
//

import SwiftUI

@main
struct CalculatorApp: App {
    @StateObject var vm = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(vm)
        }
    }
}
