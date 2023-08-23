//
//  GenericButton.swift
//  MountUI
//
//  Created by Yohanne Moreira on 01/08/23.
//

import SwiftUI

public enum Size: CGFloat {
    case large = 343
    case small = 158
    case minimal = 48
}

public enum ButtonType {
    case primary
    case secundary
}

public enum ButtonState {
    case active
    case inactive
}

public struct GenericButton: View {
    @Environment(\.colorScheme) var colorScheme
    
    let iosiColors = Color.IosiColors.self
    
    let buttonSize: Size
    let buttonType: ButtonType
    var buttonState: ButtonState
    
    let label: String
    let icon: String
    let activated: Bool = false
    
    let action: () -> Void
    
    public init(buttonSize: Size, buttonType: ButtonType, buttonState: ButtonState, label: String, icon: String, action: @escaping () -> Void) {
        self.buttonSize = buttonSize
        self.buttonType = buttonType
        self.buttonState = buttonState
        self.label = label
        self.icon = icon
        self.action = action
    }
    
    public var body: some View {
        switch buttonState {
        case .active:
            Button(action: {
                action()
            }, label: {
                switch buttonType {
                case .primary:
                    ZStack{
                        
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: buttonSize.rawValue, height: 48)
                            .foregroundColor(iosiColors.getPrimaryColors(colorScheme: colorScheme, for: .under))
                        
                        HStack(spacing: 0) {
                            Text(label)
                                .iosiFont(size: .body, weight: .bold)
                                .foregroundColor(iosiColors.iosiNeutral100)
                            if !icon.isEmpty {
                                Image(systemName: icon)
                                    .foregroundColor(iosiColors.iosiNeutral100)
                                    .padding(.horizontal, 8)
                            }
                        }
                    }
                case .secundary:
                    ZStack{
                        
                        RoundedRectangle(cornerRadius: 10)
                            .stroke()
                            .frame(width: buttonSize.rawValue, height: 48)
                            .foregroundColor(iosiColors.getPrimaryColors(colorScheme: colorScheme, for: .under))
                        
                        HStack(spacing: 0) {
                            Text(label)
                                .iosiFont(size: .body, weight: .bold)
                                .foregroundColor(iosiColors.getPrimaryColors(colorScheme: colorScheme, for: .under))
                            if !icon.isEmpty {
                                Image(systemName: icon)
                                    .foregroundColor(iosiColors.getPrimaryColors(colorScheme: colorScheme, for: .under))
                                    .padding(.horizontal, 8)
                            }
                        }
                    }
                }
            })
        case .inactive:
            switch buttonType {
            case .primary:
                ZStack{
                    
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: buttonSize.rawValue, height: 48)
                        .foregroundColor(colorScheme == .light ? Color.IosiColors.iosiNeutral93 : Color.IosiColors.iosiNeutral10)
                    
                    HStack(spacing: 0) {
                        Text(label)
                            .iosiFont(size: .body, weight: .bold)
                            .foregroundColor(colorScheme == .light ? Color.IosiColors.iosiNeutral80 : Color.IosiColors.iosiNeutral40)
                        if !icon.isEmpty {
                            Image(systemName: icon)
                                .foregroundColor(colorScheme == .light ? Color.IosiColors.iosiNeutral80 : Color.IosiColors.iosiNeutral40)
                                .padding(.horizontal, 8)
                        }
                    }
                }
            case .secundary:
                ZStack{
                    
                    RoundedRectangle(cornerRadius: 10)
                        .stroke()
                        .frame(width: buttonSize.rawValue, height: 48)
                        .foregroundColor(colorScheme == .light ? Color.IosiColors.iosiNeutral80 : Color.IosiColors.iosiNeutral40)
                    
                    HStack(spacing: 0) {
                        Text(label)
                            .iosiFont(size: .body, weight: .bold)
                            .foregroundColor(colorScheme == .light ? Color.IosiColors.iosiNeutral90 : Color.IosiColors.iosiNeutral40)
                        if !icon.isEmpty {
                            Image(systemName: icon)
                                .foregroundColor(colorScheme == .light ? Color.IosiColors.iosiNeutral90 : Color.IosiColors.iosiNeutral40)
                                .padding(.horizontal, 8)
                        }
                    }
                }
            }
        }
        
    }
}

struct ButtonGeneric_Previews: PreviewProvider {
    static var previews: some View {
        GenericButton(buttonSize: .large, buttonType: .primary, buttonState: .active, label: "Label", icon: IosiIcon.paperclip.rawValue , action: {print("a")})
    }
}
