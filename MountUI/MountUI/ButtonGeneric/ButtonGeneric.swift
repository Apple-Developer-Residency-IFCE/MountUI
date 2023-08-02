//
//  ButtonGeneric.swift
//  MountUI
//
//  Created by Yohanne Moreira on 01/08/23.
//

import SwiftUI

enum Size: CGFloat {
    case large = 343
    case small = 158
    case minimal = 48
}

enum TypeButton {
    case primary
    case secundary
}
struct ButtonGeneric: View {
    var sizeButton: Size
    var typeButton: TypeButton
    var action: () -> Void
    var label: String
    var icon: String
    
    var activated: Bool = false
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        Button(action: {
            action()
        }, label: {
            switch typeButton {
            case .primary:
                ZStack{
                    
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: sizeButton.rawValue, height: 48)
                        .foregroundColor(colorScheme == .light ? Color.DesignColors.primaryIosiPrimary10 : Color.DesignColors.primaryIosiPrimary70)
                    
                    HStack {
                        Text(label)
                            .font(.custom("Helvetica Neue", size: 16))
                            .foregroundColor(colorScheme == .light ? Color.DesignColors.neutralsIosiNeutral100 : Color.DesignColors.neutralsIosiNeutral00)
                        Image(systemName: icon).foregroundColor(colorScheme == .light ? Color.DesignColors.neutralsIosiNeutral100 : Color.DesignColors.neutralsIosiNeutral00)
                    }
                }
            case .secundary:
                RoundedRectangle(cornerRadius: 10)
                    // .foregroundColor(Color(color))
                    .frame(width: sizeButton.rawValue, height: 48)
            }
        })
    }
}

struct ButtonGeneric_Previews: PreviewProvider {
    static var previews: some View {
        ButtonGeneric( sizeButton: .large, typeButton: .primary, action: { print("oi")}, label: "Ele funciona", icon: "paperclip")
    }
}
