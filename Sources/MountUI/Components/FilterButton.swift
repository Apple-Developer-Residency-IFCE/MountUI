//
//  FilterButton.swift
//  MountUI
//
//  Created by Ian Pacini on 03/08/23.
//

import SwiftUI


public enum SizeFilterButton: CGFloat {
    // para filtros com mais de 13 caracteres e menos de 21
    case big = 166
    // para filtros com 31 ou menos caracteres
    case small = 109
}

public struct FilterButton: View {
    @State var isActive: Bool = false
    
    let action: () -> Void
    let size: SizeFilterButton
    let labelText: String
    
    var colorScheme: ColorScheme
    var colors = Color.IosiColors.self
    
    public init(colorScheme: ColorScheme, text: String ,action: @escaping () -> Void) {
        self.colorScheme = colorScheme
        self.action = action
        self.labelText = text
        
        self.size = FilterButton.getAutoSize(text: text)
    }
    
    public var body: some View {
        Button {
            self.isActive.toggle()
            action()
        } label: {
            ZStack {
                if isActive {
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
                    .foregroundColor(colors.getFilterButtonTextColor(colorScheme: colorScheme, isActive: isActive))
                    .frame(width: size.rawValue, height: 34)
            }
            .foregroundColor(colors.getPrimaryColors(colorScheme: colorScheme, for: .under))
        }
        
    }
}

public extension FilterButton {
    static func getAutoSize(text: String) -> SizeFilterButton {
        return text.count < 11 ? .small : .big
    }
}

private struct content1: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        FilterButton(colorScheme: colorScheme, text: "Course Name", action: {print("a")})
    }
}

struct FilterButton_Previews: PreviewProvider {
    static var previews: some View {
        content1()
    }
}
