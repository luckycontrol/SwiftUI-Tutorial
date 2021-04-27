//
//  VideoThumnail.swift
//  YoutubeClone
//
//  Created by 조종운 on 2021/04/24.
//

import SwiftUI

struct VideoThumnail: View {
    
    let video: String
    
    @Binding var videoNavigation: Bool
    
    var body: some View {
        VStack {
            Image(video)
                .resizable()
                .frame(width: rect.width, height: 300)
                .aspectRatio(contentMode: .fill)
                .onTapGesture {
                    withAnimation {
                        videoNavigation = true
                    }
                }
            
            HStack(alignment: .top) {
                Button(action: {}) {
                    Circle()
                        .frame(width: 35, height: 35)
                        .foregroundColor(.green)
                }
                
                Spacer(minLength: 0)
                
                Button(action: {}) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(video)
                            .foregroundColor(.primary)
                        
                        HStack(spacing: 5) {
                            Text("영상 업로더")
                            
                            Image(systemName: "circlebadge.fill")
                                .resizable()
                                .frame(width: 2, height: 2)
                            
                            Text("조회수 100만회")
                            
                            Image(systemName: "circlebadge.fill")
                                .resizable()
                                .frame(width: 2, height: 2)
                            
                            Text("1일 전")
                            
                            Spacer(minLength: 0)
                        }
                        .font(.system(size: 12))
                        .foregroundColor(.secondary)
                    }
                    .padding(.horizontal)
                }
                
                Spacer(minLength: 0)
                
                Button(action: {}) {
                    Image(systemName: "ellipsis")
                        .rotationEffect(.degrees(90))
                        .foregroundColor(.primary)
                }
            }
            .padding([.horizontal, .vertical], 5)
        }
    }
}

struct VideoThumnail_Previews: PreviewProvider {
    static var previews: some View {
        VideoThumnail(video: "video1", videoNavigation: .constant(false))
    }
}
