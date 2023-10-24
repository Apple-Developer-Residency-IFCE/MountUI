//
//  FileField.swift
//  MountUIChanges
//
//  Created by Ian Pacini on 31/08/23.
//

import SwiftUI

public enum FileType {
    //    case image
    case pdf
}

public struct FileField: View {
    @State var openFile = false
    @Binding var fileName: [String]
    @Binding var fileData: [Data]
    
    let fileType: FileType
    let colorScheme: Color.IosiColorScheme
    
    public init(fileName: Binding<[String]>, fileData: Binding<[Data]>, fileType: FileType, colorScheme: Color.IosiColorScheme) {
        self._fileName = fileName
        self._fileData = fileData
        self.fileType = fileType

        self.colorScheme = colorScheme
    }
    
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
                        .foregroundColor(Color.IosiColors.fileFieldColors(colorScheme, for: .background))
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
                                    .foregroundColor(Color.IosiColors.fileFieldColors(colorScheme, for: .subtext))
                            }
                        }
                        .foregroundColor(Color.IosiColors.fileFieldColors(colorScheme, for: .text))
                        .onTapGesture {
                            self.openFile = true
                        }
                    } else {
                        VStack(alignment: .center ,spacing: 10) {
                            Text("Arquivo selecionado:")
                                .foregroundColor(Color.IosiColors.fileFieldColors(colorScheme, for: .text))
                                .iosiFont(size: .subheadline, weight: .regular)
                            HStack(alignment: .center) {
                                Image(systemName: IosiIcon.docTextFill.rawValue)
                                    .foregroundColor(Color.IosiColors.fileFieldColors(colorScheme, for: .text))
                                Text(fileName.count == 1 ? fileName.first! : "\(fileName.count) arquivos selecionados.")
                                    .iosiFont(size: .body, weight: .bold)
                                Spacer()
                                Button {
                                    fileName = []
                                    fileData = []
                                } label: {
                                    ZStack {
                                        Circle()
                                            .foregroundColor(Color.IosiColors.fileFieldColors(colorScheme, for: .onclick))
                                            .frame(width: 24, height: 24)
                                        Image(systemName: "xmark")
                                            .resizable()
                                            .foregroundColor(Color.IosiColors.fileFieldColors(colorScheme, for: .subtext))
                                            .frame(width: 8, height: 8)
                                            .fontWeight(.bold)
                                    }
                                }
                            }
                            .padding(.vertical, 16)
                            .padding(.horizontal, 16)
                        }
                    }
                }
            }
            .foregroundColor(.gray)
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

private struct CallToFileField: View {
    @State var fileName: [String] = [""]
    @State var fileData: [Data] = []
    var body: some View {
        VStack {
            FileField(fileName: $fileName, fileData: $fileData, fileType: .pdf, colorScheme: .light)
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
