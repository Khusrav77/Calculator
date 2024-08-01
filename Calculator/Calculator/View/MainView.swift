//
//  MainView.swift
//  Calculator
//
//  Created by Khusrav Safiev on 8/1/24.
//

import SwiftUI

struct MainView: View {
    
    let buttonsArray: [[Buttons]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiple],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .decimal, .equal]
    ]
    
    var body: some View {
        
        ZStack {
            
            // MARK: Background
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 12){
                Spacer()
                // MARK: Display
                HStack {
                    Spacer()
                    Text("0")
                        .foregroundStyle(.white)
                        .font(.system(size: 90))
                        .fontWeight(.light)
                        .padding(.horizontal, 30)
                    
                }
                
                // MARK: Buttons
                ForEach(buttonsArray, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { item in
                            Button {
                                
                            }label: {
                                Text(item.rawValue)
                                
                                    .font(.largeTitle)
                                    .frame(width: self.buttonwidth(item: item), height: self.buttonHeidht())
                                    .foregroundStyle(item.buttonFonColor)
                                    .background(item.buttonColor)
                                    .clipShape(RoundedRectangle(cornerRadius: 25))
                                
                            }
                          
                        }
                    }
                }
            }
            .padding(.bottom)
        }
    }
    
    // MARK: Size Buttons 
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
        let totalSpacing: CGFloat = 5 * spacing
        let totalColums: CGFloat = 4
        let scrinWidth = UIScreen.main.bounds.width
        
        return (scrinWidth - totalSpacing) / totalColums
    }
}

#Preview {
    MainView()
}
