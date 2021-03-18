//
//  GameReady.swift
//  MileStone4
//
//  Created by 조종운 on 2021/03/17.
//

import SwiftUI

struct GameReady: View {
    
    let dans = Array(2 ..< 10)
    @State private var selectedDan = 0
    
    let problemCounts = [5, 10, 15, 20]
    @State private var selectedProblemCount = 0
    
    @State private var isStart = false
    
    @State private var timeRemaining = 3
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var nowScore = 0
    
    @State private var number = Int.random(in: 1 ... 30)
    
    @State private var inputNumber = ""
    
    @State private var resultText = ""
    
    @State private var resultTimer = 0
    
    var body: some View {
        if !isStart {
            VStack {
                // 몇 단
                if selectedDan == 0 {
                    VStack(spacing: 30) {
                        VStack(spacing: 15) {
                            Text("몇 단으로 해보실래요?")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            
                            Text("2단부터 9단까지 있어요.")
                                .font(.title3)
                                .fontWeight(.bold)
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(dans, id: \.self) { dan in
                                    Button(action: {
                                        withAnimation { selectedDan = dan }
                                    }) {
                                        Text("\(dan)")
                                            .font(.system(size: 25, weight: .bold))
                                            .linkStyle(color: "게임방법")
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                }
                
                // 몇 문제
                if selectedDan != 0 && selectedProblemCount == 0 {
                    VStack(spacing: 30) {
                        HStack {
                            Button(action: {
                                withAnimation { selectedDan = 0 }
                            }) {
                                Image(systemName: "arrow.left")
                                    .resizable()
                                    .renderingMode(.template)
                                    .foregroundColor(Color.black.opacity(0.8))
                                    .frame(width: 20, height: 20)
                            }
                            
                            Spacer()
                        }
                        
                        VStack(spacing: 15) {
                            Text("몇 문제를 풀어보실래요?")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            
                            HStack {
                                ForEach(problemCounts, id: \.self) { count in
                                    Button(action: {
                                        withAnimation { selectedProblemCount = count }
                                    }) {
                                        Text("\(count)")
                                            .font(.system(size: 25, weight: .bold))
                                            .linkStyle(color: "랭킹")
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                }
                
                if selectedDan != 0 && selectedProblemCount != 0 {
                    VStack(spacing: 30) {
                        HStack {
                            Button(action: {
                                withAnimation { selectedProblemCount = 0 }
                            }) {
                                Image(systemName: "arrow.left")
                                    .resizable()
                                    .renderingMode(.template)
                                    .foregroundColor(Color.black.opacity(0.8))
                                    .frame(width: 20, height: 20)
                            }
                            
                            Spacer()
                        }
                        
                        VStack(spacing: 15) {
                            Text("모든 준비가 끝났어요!")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            
                            Text("준비되셨으면 시작해볼까요?")
                                .font(.title3)
                                .fontWeight(.bold)
                        }
                        
                        Button(action: {
                            withAnimation { isStart = true }
                        }) {
                            Text("시작할게요!")
                                .foregroundColor(.white)
                                .font(.system(size: 25, weight: .bold))
                                .frame(width: 150, height: 150)
                                .background(Color("개인점수"))
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                            
                        }
                    }
                    .padding()
                }
                
            }
            .navigationTitle("게임준비")
        }
        else {
            ZStack {
                VStack {
                    if timeRemaining > 0 {
                        Text("\(timeRemaining)")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .onReceive(timer) { _ in
                                if timeRemaining >= 0 { timeRemaining -= 1 }
                            }
                    }
                    
                    else {
                        Text("현재점수 : \(nowScore)")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.top, 50)
                        
                        Spacer()
                        
                        VStack {
                            Text("\(selectedDan) x \(number) = ?")
                                .font(.system(size: 25, weight: .bold))
                            
                            HStack {
                                VStack {
                                    TextField("답을 입력하세요!", text: $inputNumber, onCommit: checkAnswer)
                                        .font(.system(size: 25, weight: .bold))
                                    
                                    Rectangle()
                                        .frame(height: 2)
                                        .foregroundColor(.darkPink)
                                        .padding(.vertical, 10)
                                }
                            }
                            .padding()
                        }
                        
                        Spacer()
                    }
                }
                
                if resultTimer != 0 {
                    CorrectOrNot(resultText: resultText)
                        .onReceive(timer) { _ in
                            if resultTimer > 0 {
                                withAnimation {
                                    resultTimer -= 1
                                }
                            }
                        }
                }
            }
        }
    }
    
    func checkAnswer() {
        let user_answer = Int(inputNumber) ?? 0
        
        guard user_answer != 0 else {
            return
        }
        
        // 틀렸는지 맞았는지
        if user_answer == selectedDan * number {
            resultText = "정답입니다!"
            nowScore += 10
        } else {
            resultText = "정답이아니에요!"
        }
        
        withAnimation {
            resultTimer = 2
        }
    }
}

extension Color {
    static let darkPink = Color(red: 208 / 255, green: 45 / 255, blue: 208 / 255)
}
