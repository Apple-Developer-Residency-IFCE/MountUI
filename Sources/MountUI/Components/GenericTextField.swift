//
//  GenericTextField.swift
//  MountUI
//
//  Created by Yohanne Moreira on 04/08/23.
//

import SwiftUI

public enum TypeTextField {
    case generic
    case password
//    case file
    case questionTalk
}

public struct GenericTextField: View {
    @State private var isSecured: Bool = true
    @Binding var input: String
    
    var type: TypeTextField
    var action: () -> Void
    var label: String
    var sizeWidth: CGFloat?
    var sizeHeight: CGFloat?

    let colorScheme: Color.IosiColorScheme

    public init(input: Binding<String>, type: TypeTextField, label: String = " ", sizeWidth: CGFloat? = nil, sizeHeight: CGFloat? = nil, colorScheme: Color.IosiColorScheme, action: @escaping () -> Void = {}) {
        self._input = input
        self.type = type
        self.action = action
        self.label = label
        self.sizeWidth = sizeWidth
        self.sizeHeight = sizeHeight
        self.colorScheme = colorScheme
    }

    public var body: some View {
        switch type {
            
        case .generic:
            TextField(label,
                      text: $input,
                      prompt: Text(label).foregroundColor(Color.IosiColors.textfieldColors(colorScheme, for: .text)))
                .font(Font.custom("SF Pro", size: 15))
                .padding(.horizontal, 20)
                .padding(.vertical, 15)
                .frame(width: sizeWidth, height: sizeHeight, alignment: .leading)
                .background(Color.IosiColors.textfieldColors(colorScheme, for: .background))
                .cornerRadius(10)
                .foregroundColor(Color.IosiColors.textfieldColors(colorScheme, for: .text))
            
        case .password:
            ZStack(alignment: .trailing) {
                Group {
                    if isSecured {
                        SecureField(label,
                                    text: $input,
                                    prompt: Text(label).foregroundColor(Color.IosiColors.textfieldColors(colorScheme, for: .text))) //securefield
                    } else {
                        TextField(label,
                                  text: $input,
                                  prompt: Text(label).foregroundColor(Color.IosiColors.textfieldColors(colorScheme, for: .text))) //textfield
                    }
                }
                
                Button(action: {
                    isSecured.toggle()
                }) {
                    Image(systemName: self.isSecured ? "eye.slash" : "eye")
                        .foregroundColor(Color.IosiColors.textfieldColors(colorScheme, for: .text))
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 15)
            .frame(width: sizeWidth, height: sizeHeight, alignment: .leading)
            .foregroundColor(Color.IosiColors.textfieldColors(colorScheme, for: .text))
            .background(Color.IosiColors.textfieldColors(colorScheme, for: .background))
            .cornerRadius(10)
        case .questionTalk:
            HStack {
                TextField(label,
                          text: $input,
                          prompt: Text(label).foregroundColor(Color.IosiColors.textfieldColors(colorScheme, for: .text)))
                    .frame(alignment: .leading)
                    .font(Font.custom("SF Pro", size: 15))
                
                Button(action: {
                    action()
                }, label: {
                    Image(systemName: IosiIcon.paperplane.rawValue)
                        .foregroundColor(Color.IosiColors.textfieldColors(colorScheme, for: .text))
                        .rotationEffect(.degrees(45))
                })
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 15)
            .frame(width: sizeWidth, height: sizeHeight)
            .foregroundColor(Color.IosiColors.textfieldColors(colorScheme, for: .text))
            .background(Color.IosiColors.textfieldColors(colorScheme, for: .background))
            .cornerRadius(10)
        }
    }
}

private struct teste: View {
    @State var inputTest: String = ""
    
    var body: some View {
        GenericTextField(input: $inputTest, type: .questionTalk, label: "Label", colorScheme: .midTone)
    }
}


struct GenericTextField_Previews: PreviewProvider {
    static var previews: some View {
        teste()
    }
}
