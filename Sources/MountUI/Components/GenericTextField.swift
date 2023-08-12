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
    case file
    case questionTalk
    case passcodeTalk
    case comentaryTalk
}
public struct GenericTextField: View {
    @Environment(\.colorScheme) var colorScheme
    
    @State private var isSecured: Bool = true
    @State var fileName: String = ""
    @State var openFile: Bool = false
    @Binding var input: String
    
    var type: TypeTextField
    var action: () -> Void
    var label: String
    var sizeWidth: CGFloat
    var sizeHeight: CGFloat
    public init(input: Binding<String>, type: TypeTextField, action:@escaping () -> Void = {}, label: String = " ", sizeWidth: CGFloat = 343, sizeHeight: CGFloat = 48) {
        self._input = input
        self.type = type
        self.action = action
        self.label = label
        self.sizeWidth = sizeWidth
        self.sizeHeight = sizeHeight
    }
    
    public var body: some View {
        switch type {
        case .generic:
                TextField( label , text: $input)
                    .font(Font.custom("SF Pro", size: 15))
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    .frame(width: sizeWidth, height: sizeHeight, alignment: .leading)
                    .background(Color(red: 0.95, green: 0.95, blue: 0.97))
                    .cornerRadius(10)
            
        case .password:
                ZStack(alignment: .trailing) {
                    Group {
                        if isSecured {
                            SecureField("Senha", text: $input) //securefield
                        } else {
                            TextField("Senha", text: $input) //textfield
                        }
                    }
                    
                    Button(action: {
                        isSecured.toggle()
                    }) {
                        Image(systemName: self.isSecured ? "eye.slash" : "eye")
                            .accentColor(.gray)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 15)
                .frame(width: 343, height: 48, alignment: .leading)
                .background(Color(red: 0.95, green: 0.95, blue: 0.97))
                .cornerRadius(10)

        case .file:
            
            VStack{
                if fileName.isEmpty {
                    Button {
                        self.openFile.toggle()
                    } label: {
                        VStack{
                            Image(systemName: IosiIcon.arrowUpDoc.rawValue)
                                .foregroundColor(Color.IosiColors.iosiPrimary30)
                                .padding(.bottom, 10)
                            Text("Selecione um arquivo")
                                .iosiFont(size: .subheadline, weight: .regular)
                                .foregroundColor(Color.IosiColors.iosiPrimary30)
                        }
                    }
                } else {
                    VStack {
                        Text("Arquivo selecionado: ")
                            .foregroundColor(Color.IosiColors.iosiPrimary30)
                            .padding(.bottom, 10)
                        
                        HStack {
                            Image(systemName: IosiIcon.docTextFill.rawValue)
                            Text(self.fileName)
                                .foregroundColor(Color.IosiColors.iosiPrimary30)
                        }
                    }
                }
            }
            .fileImporter( isPresented: $openFile, allowedContentTypes: [.audio,.image,.pdf], allowsMultipleSelection: true, onCompletion: {
                (Result) in
                
                do{
                    let fileURL = try Result.get()
                    print(fileURL)
                    self.fileName = fileURL.first?.lastPathComponent ?? "file not available"
                    
                }
                catch{
                    print("error reading file (error.localizedDescription)")
                }
                
            })
            .padding(.horizontal, 20)
            .padding(.vertical, 15)
            .frame(width: 343, height: 169, alignment: .center)
            .background(Color(red: 0.95, green: 0.95, blue: 0.97))
            .cornerRadius(10)

        case .questionTalk:
            HStack {
                    
                TextField("Escreva uma mensagem", text: $input)
                    .frame(alignment: .leading)
                    .font(Font.custom("SF Pro", size: 15))
                
                Button(action: {
                   action()
                }, label: {
                    Image(systemName: IosiIcon.paperplane.rawValue)
                            .foregroundColor(Color.IosiColors.iosiPrimary10)
                            .rotationEffect(.degrees(45))
                })
            }.padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    .frame(width: 343, height: 48)
                    .background(Color(red: 0.95, green: 0.95, blue: 0.97))
                    .cornerRadius(10)
            
        case .passcodeTalk:
            
                TextField("xxx-xxxx-xxx", text: $input)
                    .font(Font.custom("SF Pro", size: 15))
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    .frame(width: 343, height: 48, alignment: .leading)
                    .background(Color(red: 0.95, green: 0.95, blue: 0.97))
                    .cornerRadius(10)
                
            
        case .comentaryTalk:
            TextField("Comentário para o(a) professor(a)", text: $input)
                  .font(Font.custom("SF Pro", size: 15))
                  .foregroundColor(Color(red: 0.56, green: 0.56, blue: 0.58))
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    .frame(width: 343, height: 48, alignment: .leading)
                    .background(Color(red: 0.95, green: 0.95, blue: 0.97))
                    .cornerRadius(10)
        }
        
    }
}


struct teste: View {
    @State var inputTest: String = ""
    
    var body: some View {
        GenericTextField(input: $inputTest, type: .generic, label: "Label", sizeWidth: 300, sizeHeight: 56)
    }
}


struct GenericTextField_Previews: PreviewProvider {
    static var previews: some View {
        teste()
    }
}
