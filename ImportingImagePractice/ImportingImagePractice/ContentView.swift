//
//  ContentView.swift
//  ImportingImagePractice
//
//  Created by 조종운 on 2020/07/23.
//  Copyright © 2020 조종운. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var imagePicker = false
    
    @State private var inputImage: UIImage?
    
    @State var image: Image?
    
    var body: some View {
        VStack {
            
            image?
                .resizable()
                .frame(width: 300, height: 300)
            
            Button(action: { self.imagePicker = true }) {
                Text("Select Any Photo")
            }
        }
        .sheet(isPresented: $imagePicker, onDismiss: loadImage) {
            ImagePicker(image: self.$inputImage)
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
