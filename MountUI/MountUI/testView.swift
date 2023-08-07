//
//  testView.swift
//  MountUI
//
//  Created by Ian Pacini on 02/08/23.
//

import SwiftUI

struct testView: View {
    @Environment(\.colorScheme) var colorScheme
    let iosiColor = Color.IosiColors.self

    var body: some View {
        VStack(spacing: 150){
            
            
            //use color like this
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .iosiFont(size: .largeTitle, weight: .bold)
                .foregroundColor(iosiColor.getPrimaryColors(colorScheme: colorScheme, for: .background))
            
            //instead of this
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .iosiFont(size: .largeTitle, weight: .bold)
                .foregroundColor(colorScheme == .light ? iosiColor.iosiPrimary10 : iosiColor.iosiPrimary70)
            
        }
    }
}

struct testView_Previews: PreviewProvider {
    static var previews: some View {
        testView( iconezinho: .docPlaintFill)
    }
}
