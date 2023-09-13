//
//  FileField.swift
//  MountUIChanges
//
//  Created by Ian Pacini on 31/08/23.
//

import SwiftUI

enum FileType {
    //    case image
    case pdf
}

public struct FileField: View {
    @Environment(\.colorScheme) var colorScheme
    
    @State var openFile = false
    @Binding var fileName: [String]
    @Binding var fileData: [Data?]
    
    let fileType: FileType
    
    public var body: some View {
        switch fileType {
            //        case .image:
            //            ZStack(alignment: .center) {
            //                RoundedRectangle(cornerRadius: 12)
            //                    .foregroundColor(Color.IosiColors.getTextFieldColors(colorScheme: colorScheme, for: .under))
            //                VStack(spacing: 10) {
            //                    Image(systemName: IosiIcon.photo.rawValue)
            //                        .resizable()
            //                        .frame(width: 52, height: 40)
            //                    VStack(spacing: 0) {
            //                        Text("Selecione até 5 imagens")
            //                            .iosiFont(size: .subheadline, weight: .regular)
            //                        Text("Tamano máximo permitido de 10mb")
            //                            .iosiFont(size: .footnote, weight: .bold)
            //                            .foregroundColor(colorScheme == .light ? Color.IosiColors.iosiNeutral50 : Color.IosiColors.iosiNeutral80)
            //                    }
            //                }
            //            }
            //            .onTapGesture {
            //                self.openFile = true
            //            }
            //            .foregroundColor(Color.IosiColors.getTextFieldColors(colorScheme: colorScheme, for: .label))
            //            .fileImporter( isPresented: $openFile, allowedContentTypes: [.image], allowsMultipleSelection: true, onCompletion: {
            //                (Result) in
            //
            //                do{
            //                    let fileURL = try Result.get()
            //                    print(fileURL)
            //                    self.fileName = fileURL.first?.lastPathComponent ?? "file not available"
            //
            //                }
            //                catch{
            //                    print("error reading file (error.localizedDescription)")
            //                }
            //
            //            })
            //
        case .pdf:
            Group {
                ZStack(alignment: .center) {
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundColor(Color.IosiColors.getTextFieldColors(colorScheme: colorScheme, for: .under))
                    if fileName.isEmpty {
                        VStack(spacing: 10) {
                            Image(systemName: IosiIcon.arrowUpDoc.rawValue)
                                .resizable()
                                .frame(width: 32, height: 40)
                            VStack(spacing: 0) {
                                Text("Selecione um arquivo")
                                    .iosiFont(size: .subheadline, weight: .regular)
                                Text("Tamano máximo permitido de 10MB")
                                    .iosiFont(size: .footnote, weight: .bold)
                                    .foregroundColor(colorScheme == .light ? Color.IosiColors.iosiNeutral50 : Color.IosiColors.iosiNeutral80)
                            }
                        }
                        .onTapGesture {
                            self.openFile = true
                        }
                    } else {
                        VStack(alignment: .center ,spacing: 10) {
                            Text("Arquivo selecionado:")
                                .iosiFont(size: .subheadline, weight: .regular)
                            HStack(alignment: .center) {
                                Image(systemName: IosiIcon.docTextFill.rawValue)
                                Text(fileName.count == 1 ? fileName.first! : "\(fileName.count) arquivos selecionados.")
                                    .iosiFont(size: .body, weight: .bold)
                            }
                            .padding(.vertical, 16)
                            .padding(.horizontal, 8)
                        }
                    }
                }
            }
            .foregroundColor(Color.IosiColors.getTextFieldColors(colorScheme: colorScheme, for: .label))
            .fileImporter( isPresented: $openFile, allowedContentTypes: [.pdf, .image], allowsMultipleSelection: true, onCompletion: { result in
                
                
                do{
                    let fileURL = try result.get()
                    for url in fileURL {
                        self.fileName.append(url.lastPathComponent)
                    }
                    for file in fileURL {
                        self.fileData.append( try Data(contentsOf: file) )
                        
                    }
                }
                catch{
                    print("error reading file (error.localizedDescription)")
                }
                
            })
        }
    }
}

struct CallToFileField: View {
    @State var fileName: [String] = []
    @State var fileData: [Data?] = []
    var body: some View {
        VStack {
            FileField(fileName: $fileName, fileData: $fileData, fileType: .pdf)
                .frame(width: 344, height: 170)
            
            Button {
                print(fileName)
                print(fileData)
            } label: {
                Text("test name")
            }

        }
    }
}

struct FileField_Previews: PreviewProvider {
    static var previews: some View {
        CallToFileField()
    }
}
