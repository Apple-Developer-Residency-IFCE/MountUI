//
//  GenericSnackbar.swift
//  MountUI
//
//  Created by Ian Pacini on 03/08/23.
//

import SwiftUI

public enum SnackbarColor {
    case green
    case red
}

public struct GenericSnackbar: View {

    @Binding var isShowing: Bool

    let text: String
    let color: SnackbarColor
    let iosiColor = Color.IosiColors.self
    let colorScheme: Color.IosiColorScheme

    public init(isShowing: Binding<Bool>, text: String, color: SnackbarColor, colorScheme: Color.IosiColorScheme) {
        self._isShowing = isShowing
        self.text = text
        self.color = color
        self.colorScheme = colorScheme
    }

    public var body: some View {
        HStack{
            Text(text)
                .foregroundColor(color == .green ? iosiColor.greenSnackBarColors(colorScheme, for: .text) : iosiColor.redSnackBarColors(colorScheme, for: .text))
                .iosiFont(size: .subheadline, weight: .regular)
            
            Spacer(minLength: 24)
            
            Button {
                isShowing.toggle()
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(color == .green ? iosiColor.greenSnackBarColors(colorScheme, for: .text) : iosiColor.redSnackBarColors(colorScheme, for: .text))
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .frame(width: 360)
        .background(){
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(color == .green ? iosiColor.greenSnackBarColors(colorScheme, for: .background) : iosiColor.redSnackBarColors(colorScheme, for: .background))
        }
    }
}

private struct content: View {
    @State var isShowing = true
    
    var body: some View {
        VStack {
            if isShowing {
                GenericSnackbar(isShowing: $isShowing, text: "Teste", color: .red, colorScheme: .dark)
            } else {
                Button {
                    isShowing.toggle()
                } label: {
                    Text("Teste")
                }
            }
        }
    }
}

struct GenericSnackbar_Previews: PreviewProvider {
    static var previews: some View {
        content()
    }
}
