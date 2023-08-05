//
//  TextField.swift
//  MountUI
//
//  Created by Yohanne Moreira on 04/08/23.
//

import SwiftUI


struct TextField: View {
    @State private var username: String = ""
    
    var body: some View {
        VStack {
            if !username.isEmpty { // <1>
                Text("Welcome \(username)!") // <2>
            }
            TextField()
                .background(){
                    HStack(alignment: .center, spacing: 10) {
                        Rectangle()
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    .frame(width: 343, height: 48, alignment: .leading)
                    .background(Color(red: 0.11, green: 0.11, blue: 0.12))
                    .cornerRadius(10)
                }
        }
    }
}

struct TextField_Previews: PreviewProvider {
    static var previews: some View {
        TextField()
    }
}
