//
//  FilterButton.swift
//  MountUI
//
//  Created by Ian Pacini on 03/08/23.
//

import SwiftUI

//types created in generic button file
//enum ButtonType {
//    case primary
//    case secundary
//}

struct FilterButton: View {
    
    let buttonType: ButtonType
    let action: () -> Void
    
    let labelText: String
    
    let textColor: Color
    let buttonColor: Color
    
    init(buttonType: ButtonType, colorScheme: ColorScheme, text: String ,action: @escaping () -> Void) {
        self.buttonType = buttonType
        self.action = action
        
        self.labelText = text
        
        if buttonType == .primary {
            let colors = FilterButton.getPrimaryColors(colorScheme: colorScheme)
            textColor = colors[0]
            buttonColor = colors[1]
        } else {
            let colors = FilterButton.getSecundaryColors(colorScheme: colorScheme)
            textColor = colors[0]
            buttonColor = colors[1]
        }
    }
    
    var body: some View {
        Button {
            action()
        } label: {
            
            Text(labelText)
                .iosiFont(size: .footnote, weight: .regular)
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .foregroundColor(textColor)
                .background() {
                    if buttonType == .primary {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(width: .infinity, height: 34)
                    } else {
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(lineWidth: 1)
                            .frame(width: .infinity, height: 34)
                    }
                }
                .foregroundColor(buttonColor)
        }
        
    }
}

extension FilterButton {
    
    static func getPrimaryColors(colorScheme: ColorScheme) -> [Color] {
        
        if colorScheme == .light {
            return [Color.IosiColors.iosiNeutral100, Color.IosiColors.iosiPrimary10]
        } else {
            return [Color.IosiColors.iosiNeutral100, Color.IosiColors.iosiPrimary70]
        }
    }
    
    static func getSecundaryColors(colorScheme: ColorScheme) -> [Color] {
        if colorScheme == .light {
            return [Color.IosiColors.iosiPrimary10, Color.IosiColors.iosiPrimary10]
        } else {
            return [Color.IosiColors.iosiNeutral100, Color.IosiColors.iosiNeutral100]
        }
    }
}

struct content1: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        FilterButton(buttonType: .primary, colorScheme: colorScheme, text: "Test Course Name, Very Big Label (TCNVBL)", action: {print("a")})
    }
}

struct FilterButton_Previews: PreviewProvider {
    static var previews: some View {
        content1()
    }
}
