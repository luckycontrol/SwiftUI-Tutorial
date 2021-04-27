//
//  Main.swift
//  YoutubeClone
//
//  Created by 조종운 on 2021/04/24.
//

import SwiftUI
import AVKit

var edges = UIApplication.shared.windows.first?.safeAreaInsets
var rect = UIScreen.main.bounds

struct Main: View {
    
    @StateObject var headerData = HeaderViewModel()
    
    @State private var videoNavigation = false
    
    let videos = ["video1", "video2", "video3", "video4", "video5"]
    
    init() {
        UIScrollView.appearance().bounces = false
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            Header()
                .zIndex(1)
                .offset(y: headerData.isScrollDown ? -170 : 0)
            
            ScrollView {
                VStack {
                    ForEach(videos, id: \.self) { video in
                        VideoThumnail(video: video, videoNavigation: $videoNavigation)
                    }
                }
                .padding(.top, 55)
                .padding(.bottom, 65)
                .overlay(
                    GeometryReader { geometry -> Color in
                        let minY = geometry.frame(in: .global).minY
                        
                        DispatchQueue.main.async {
                            if headerData.nowOffset == 0 {
                                headerData.nowOffset = minY
                                headerData.newOffset = minY
                            }
                            
                            else if minY < 48 && headerData.newOffset != minY {
                                headerData.newOffset = minY
                            }
                        }
                        
                        return Color.clear
                    }
                )
            }
            
            VStack {
                Spacer()
                
                Bottom()
            }
            
            if videoNavigation {
                VideoDetail()
                    .transition(.move(edge: .bottom))
                    .onTapGesture {
                        withAnimation {
                            videoNavigation = false
                        }
                    }
                    .zIndex(3)
            }
        }
        
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
