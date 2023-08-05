//
//  SwiftUIView.swift
//  MountUI
//
//  Created by Ian Pacini on 04/08/23.
//

import SwiftUI
struct ContentView: View {
    @State var fileName = "no file chosen"
    @State var openFile = false
    
    var body: some View {
        VStack(spacing: 25){
            
            if fileName == "no file chosen" {
                
                Image(systemName: "doc.fill")
                    .foregroundColor(.blue)
                
                Button {
                    self.openFile.toggle()
                } label: {
                    Text("Open Document Picker")
                }
                
            } else {
                
                Text("arquivo selecionado:")
                
                Text(self.fileName)
                    .foregroundColor(.blue)
                
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
                print("error reading file \(error.localizedDescription)")
            }
            
        })
        .background() {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 343, height: 169)
        }
        
    }
}
    
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
