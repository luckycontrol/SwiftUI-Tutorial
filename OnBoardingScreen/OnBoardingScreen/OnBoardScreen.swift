//
//  OnBoardScreen.swift
//  OnBoardingScreen
//
//  Created by 조종운 on 2020/10/30.
//

import SwiftUI

struct OnBoardScreen: View {
    
    @State private var maxWidth = UIScreen.main.bounds.width - 100
    
    @State private var offset: CGFloat = 0
    
    var body: some View {
        ZStack {
            Color("bg")
                .ignoresSafeArea(.all, edges: .all)
            
            VStack {
                
                Spacer(minLength: 0)
                
                Text("CHECK YOUR MONEY")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
                Text("당신의 자산을 관리해드립니다.")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .padding()
                    .padding(.bottom)
                
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    
                Spacer(minLength: 0)
                
                // MARK: Slider
                ZStack {
                    Capsule()
                        .fill(Color.white.opacity(0.1))
                    
                    // MARK: Background Process
                    HStack {
                        Capsule()
                            .fill(Color("red"))
                            .frame(width: calculateWidth() + 65)
                        
                        Spacer(minLength: 0)
                    }
                    
                    Text("SWIPE TO START")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    
                    HStack {
                        ZStack {
                            Image(systemName: "chevron.right")
                            
                            Image(systemName: "chevron.right")
                                .offset(x: -10)
                        }
                        .foregroundColor(.white)
                        .frame(width: 65, height: 65)
                        .background(Color("red"))
                        .clipShape(Circle())
                        .offset(x: offset)
                        .gesture(DragGesture()
                                    .onChanged(onChanged(value:))
                                    .onEnded(onEnd(value:))
                                 )
                        
                        
                        Spacer()
                    }
                }
                .frame(width: maxWidth, height: 65)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                NotificationCenter.default.post(name: NSNotification.Name("Success"), object: nil)
            }
        }
    }
    
    func calculateWidth() -> CGFloat {
        let percent = offset / maxWidth
        
        return percent * maxWidth
    }
    
    func onChanged(value: DragGesture.Value) {
        // Update
        if value.translation.width > 0 && offset <= maxWidth - 65 {
            offset = value.translation.width
        }
    }
    
    func onEnd(value: DragGesture.Value) {
        // BackOff Animation
        
        withAnimation(Animation.easeOut(duration: 0.3)) {
            if offset > 180 {
                offset = maxWidth - 65
                
                // 사용자에게 알림
                
                // 애니메이션이 끝날때까지 딜레이
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                    NotificationCenter.default.post(name: NSNotification.Name("Success"), object: nil)
                }
            } else {
                offset = 0
            }
        }
    }
}

struct OnBoardScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OnBoardScreen()
        }
    }
}
