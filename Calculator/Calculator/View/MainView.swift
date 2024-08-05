//
//  MainView.swift
//  Calculator
//
//  Created by Khusrav Safiev on 8/1/24.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var vm: ViewModel
    
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
                    Text(vm.value)
                        .foregroundStyle(.white)
                        .font(.system(size: 90))
                        .fontWeight(.light)
                        .padding(.horizontal, 30)
                    
                }
                
                // MARK: Buttons
                ForEach(vm.buttonsArray, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { item in
                            Button {
                                vm.didTap(item: item)
                            }label: {
                                Text(item.rawValue)
                                    .font(.largeTitle)
                                    .frame(
                                        width: vm.buttonwidth(item: item),
                                        height: vm.buttonHeidht())
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
}

#Preview {
    MainView()
        .environmentObject(ViewModel())
}
