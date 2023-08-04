//
//  testView.swift
//  MountUI
//
//  Created by Ian Pacini on 02/08/23.
//

import SwiftUI

struct testView: View {
   var iconezinho: Icon
    var body: some View {

       Image(systemName: iconezinho.rawValue).foregroundColor(.black)


    }
}

struct testView_Previews: PreviewProvider {
    static var previews: some View {
        testView( iconezinho: .docPlaintFill)
    }
}
