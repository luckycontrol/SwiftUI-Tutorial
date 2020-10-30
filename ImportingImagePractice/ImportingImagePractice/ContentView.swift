//
//  ContentView.swift
//  ImportingImagePractice
//
//  Created by 조종운 on 2020/07/23.
//  Copyright © 2020 조종운. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var image: Image?
    
    @State var uiImage: UIImage?
    
    @State var ImagePicking = false
    
    var body: some View {
        VStack {
            
            image?
                .resizable()
                .frame(width: 100, height: 100)
            
            Button(action: {
                self.ImagePicking = true
            }) {
                Text("Select Image")
            }
            .sheet(isPresented: $ImagePicking, onDismiss: loadImage) {
                ImagePicker(uiImage: self.$uiImage, sourceType: .photoLibrary)
            }
            
            Button(action: {
                self.ImagePicking = true
            }) {
                Text("Using Camera")
            }
            .sheet(isPresented: $ImagePicking, onDismiss: loadImage) {
                ImagePicker(uiImage: self.$uiImage, sourceType: .camera)
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
