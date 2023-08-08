//
//  GenericSnackbar.swift
//  MountUI
//
//  Created by Ian Pacini on 03/08/23.
//

import SwiftUI

enum SnackbarColor {
    case green
    case red
}

struct GenericSnackbar: View {
    
    @Binding var isShowing: Bool
    
    @Environment(\.colorScheme) var colorScheme
    
    let text: String
    let color: SnackbarColor
    let iosiColor = Color.IosiColors.self
    var body: some View {
        HStack{
            Text(text)
                .foregroundColor(Color.IosiColors.iosiNeutral100)
                .iosiFont(size: .subheadline, weight: .regular)
            
            Spacer(minLength: 24)
            
            Button {
                isShowing = false
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(Color.IosiColors.iosiNeutral100)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .frame(width: 360, height: .infinity)
        .background(){
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(color == .green ? iosiColor.getSuccesColors(colorScheme: colorScheme, for: .under) : iosiColor.getErrorColors(colorScheme: colorScheme, for: .under))
        }
    }
}

struct content: View {
    @State var isShowing = true
    
    var body: some View {
        GenericSnackbar(isShowing: $isShowing, text: "Teste", color: .red)
    }
}

struct GenericSnackbar_Previews: PreviewProvider {
    static var previews: some View {
        content()
    }
}
