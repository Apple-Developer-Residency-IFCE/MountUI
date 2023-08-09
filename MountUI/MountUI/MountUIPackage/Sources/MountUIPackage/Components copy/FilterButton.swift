//
//  FilterButton.swift
//  MountUI
//
//  Created by Ian Pacini on 03/08/23.
//

import SwiftUI

public enum SizeFilterButton: CGFloat {
    // para filtros com mais de 13 caracteres e menos de 21
    case big = 171
    // para filtros com 31 ou menos caracteres
    case small = 112
}

 public struct FilterButton: View {
    
    let buttonType: ButtonType
    let action: () -> Void
     let size: SizeFilterButton
    let labelText: String
    
    let textColor: Color
    let buttonColor: Color
    
     public init(buttonType: ButtonType, colorScheme: ColorScheme, size: SizeFilterButton, text: String ,action: @escaping () -> Void) {
        self.buttonType = buttonType
        self.action = action
        self.size = size
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
    
     public var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                if buttonType == .primary {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: size.rawValue, height: 34)
                } else {
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(lineWidth: 1)
                        .frame(width: size.rawValue, height: 34)
                }
                
                Text(labelText)
                    .iosiFont(size: .footnote, weight: .regular)
                    .padding(.vertical, 8)
                    .padding(.horizontal, 16)
                    .foregroundColor(textColor)
                    .frame(width: size.rawValue, height: 34)
            }
                .foregroundColor(buttonColor)
        }
        
    }
}

public extension FilterButton {
    
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
        FilterButton(buttonType: .secundary, colorScheme: colorScheme, size: .big, text: "Test Course", action: {print("a")})
    }
}

struct FilterButton_Previews: PreviewProvider {
    static var previews: some View {
        content1()
    }
}
