//
//  GenericTextField.swift
//  MountUI
//
//  Created by Yohanne Moreira on 04/08/23.
//

import SwiftUI

enum TypeTextField {
    case email
    case senha
    case arquivo
    case duvidaTalk
    case codigoTalk
    case comentarioTalk
}
struct GenericTextField: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var isSecured: Bool = true
    @Binding var input: String
    @Binding var fileName: String
    @Binding var openFile: Bool
    
    var type: TypeTextField
    
    var body: some View {
        switch type {
        case .email:
                TextField("E-mail", text: $input)
                    .font(Font.custom("SF Pro", size: 15))
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    .frame(width: 343, height: 48, alignment: .leading)
                    .background(Color(red: 0.95, green: 0.95, blue: 0.97))
                    .cornerRadius(10)
            
        case .senha:
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

        case .arquivo:
            
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

        case .duvidaTalk:
             HStack{
                TextField("Escreva uma mensagem", text: $input)
                    .font(Font.custom("SF Pro", size: 15))
                
                Image(systemName: IosiIcon.paperplane.rawValue)
                 
            }.padding(.horizontal, 20)
                .padding(.vertical, 15)
                .frame(width: 343, height: 48, alignment: .leading)
                .background(Color(red: 0.95, green: 0.95, blue: 0.97))
                .cornerRadius(10)
            
        case .codigoTalk:
            
                TextField("xxx-xxxx-xxx", text: $input)
                    .font(Font.custom("SF Pro", size: 15))
                    .padding(.horizontal, 20)
                    .padding(.vertical, 15)
                    .frame(width: 343, height: 48, alignment: .leading)
                    .background(Color(red: 0.95, green: 0.95, blue: 0.97))
                    .cornerRadius(10)
                
            
        case .comentarioTalk:
                Text("Comentário para o(a) professor(a)")
                  .font(Font.custom("SF Pro", size: 15))
                  .multilineTextAlignment(.center)
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
    @State var fileName = ""
    @State var openFile = false
    
    var body: some View {
        GenericTextField(input: $inputTest, fileName: $fileName, openFile: $openFile, type: .comentarioTalk)
    }
}


struct GenericTextField_Previews: PreviewProvider {
    static var previews: some View {
        teste()
    }
}
