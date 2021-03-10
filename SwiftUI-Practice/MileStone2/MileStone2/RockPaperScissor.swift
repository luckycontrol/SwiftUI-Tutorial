//
//  RockPaperScissor.swift
//  MileStone2
//
//  Created by 조종운 on 2021/03/10.
//

import SwiftUI

struct RockPaperScissor: View {
    
    @State private var score = 0
    
    @State private var resultText = ""
    
    
    
    private let choices = ["가위", "바위", "보"]
    
    func game(choice: Int) {
        var user = choice
        let com = Int.random(in: 0 ..< choices.count)
        let generator = UINotificationFeedbackGenerator()
        
        if com == user {
            resultText = "비겼습니다!"
            score += 5
            generator.notificationOccurred(.warning)
        }
        else {
    
            if user - 1 <= 0 {
                user = choices.count
            }
            
            if user - 1 == com {
                resultText = "이겼습니다!"
                score += 10
                generator.notificationOccurred(.success)
            }
            else {
                resultText = "졌어요.."
                score -= 5
                generator.notificationOccurred(.error)
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("\(resultText)")
                .font(.title)
                .fontWeight(.bold)
                .animation(.easeInOut)
            
            Text("가위 바위 보 한 판!")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("점수 : \(score) 점")
                .fontWeight(.semibold)
                .padding(.bottom, 15)
            
            HStack(spacing: 5) {
                ForEach(0 ..< choices.count) { choice in
                    Button(action: {
                        game(choice: choice)
                    }) {
                        Text("\(choices[choice])")
                            .fontWeight(.bold)
                            .buttonStyle()
                    }
                    
                }
            }
            .padding()
        }
    }
}

func simpleSuccess() {
    let generator = UINotificationFeedbackGenerator()
    generator.notificationOccurred(.success)
}

extension View {
    func buttonStyle() -> some View {
        self.modifier(ButtonStyle())
    }
}

struct ButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: 150)
            .background(LinearGradient(gradient: Gradient(colors: [.red, .orange]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .foregroundColor(.white)
            .cornerRadius(15)
    }
}

struct RockPaperScissor_Previews: PreviewProvider {
    static var previews: some View {
        RockPaperScissor()
    }
}
