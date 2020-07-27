//
//  ContentView.swift
//  UsingCameraRollPractice
//
//  Created by 조종운 on 2020/07/27.
//  Copyright © 2020 조종운. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var uiImage: UIImage?
    
    @State var image: Image?

    @State var imagePicker = false
    
    @State var sourceType: UIImagePickerController.SourceType?
    
    var body: some View {
        VStack {
            
            image?
                .resizable()
                .frame(width: 300, height: 300)
            
            Button(action: {
                self.imagePicker = true
                self.sourceType = .photoLibrary
            }) {
                Text("Photo Library")
            }
            .sheet(isPresented: $imagePicker, onDismiss: loadImage) {
                ImagePicker(uiImage: self.$uiImage, sourceType: self.$sourceType)
            }
            
            Button(action: {
                self.imagePicker = true
                self.sourceType = .camera
            }) {
                Text("Using Camera")
            }
            .sheet(isPresented: $imagePicker, onDismiss: loadImage) {
                ImagePicker(uiImage: self.$uiImage, sourceType: self.$sourceType)
            }
        }
    }
    
    func loadImage() {
        guard let uiImage = uiImage else { return }
        image = Image(uiImage: uiImage)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
