//
//  VideoDetail.swift
//  YoutubeClone
//
//  Created by 조종운 on 2021/04/25.
//

import SwiftUI
import AVKit

struct VideoDetail: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var isTouch = false
    
    @State private var isStart = false
    
    @State private var value: Float = 0
    
    @State private var location: CGPoint = .zero
    
    let rect = UIScreen.main.bounds
    
    var body: some View {
        VStack {
            Rectangle()
                .frame(width: rect.width, height: rect.height * 0.3)
                .foregroundColor(.green)
            
            ScrollView {
                
            }
        }
        .frame(width: rect.width, height: rect.height)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .position(location)
        .gesture(
            DragGesture()
                .onChanged { value in
                    location.y = value.location.y
                }
        )
    }
}

struct VideoControl: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var isStart: Bool
    
    @Binding var isTouch: Bool
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.down")
                        .font(.title2)
                }
                
                Spacer()
            }
            .padding()
            
            Spacer()
            
            HStack(spacing: 40) {
                Button(action: {}) {
                    Image(systemName: "backward.end")
                        .font(.title2)
                }
                
                Button(action: {}) {
                    Image(systemName: "play")
                        .font(.title)
                }
                
                Button(action: {}) {
                    Image(systemName: "forward.end")
                        .font(.title2)
                }
            }
            .padding()
            
            Spacer()
            
            HStack {
                
            }
            .padding()
        }
        .foregroundColor(.white)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.3)
        .background(Color.black.opacity(0.3))
        .onTapGesture {
            withAnimation {
                isTouch = false
            }
        }
        
    }
}

//struct VideoPlayer: UIViewControllerRepresentable {
//
//    let player: AVPlayer
//
//    func makeUIViewController(context: UIViewControllerRepresentableContext<VideoPlayer>) -> AVPlayerViewController {
//
//        let controller = AVPlayerViewController()
//        controller.showsPlaybackControls = false
//        controller.player = player
//        controller.videoGravity = .resize
//
//        return controller
//    }
//
//    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: UIViewControllerRepresentableContext<VideoPlayer>) {
//
//    }
//}

struct VideoDetail_Previews: PreviewProvider {
    static var previews: some View {
        VideoDetail()
    }
}
