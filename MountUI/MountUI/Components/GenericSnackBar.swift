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
    
    let text: String
    let color: SnackbarColor
    private let actualColor: Color
    
    init(isShowing: Binding<Bool>, color: SnackbarColor, text: String) {
        self._isShowing = isShowing
        self.text = text
        self.color = color
        
        self.actualColor = color == .green ?
        Color.IosiColors.iosiSuccess30 :
        Color.IosiColors.iosiError50
        
    }
    
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
                .foregroundColor(actualColor)
        }
    }
}

struct content: View {
    @State var isShowing = true
    
    var body: some View {
        GenericSnackbar(isShowing: $isShowing, color: .green, text: "Testeaa")
    }
}

struct GenericSnackbar_Previews: PreviewProvider {
    static var previews: some View {
        content()
    }
}
