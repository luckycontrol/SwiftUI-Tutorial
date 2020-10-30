//
//  ContentView.swift
//  CreateAccountView
//
//  Created by 조종운 on 2020/10/17.
//

import SwiftUI
 
struct ContentView: View {
    
    @State private var name = ""
    
    @State private var nameStatus = false
    
    @State private var address = ""
    
    @State private var addressStatus = false
    
    @State private var hp = ""
    
    @State private var hpStatus = false
    
    var body: some View {
        ZStack {
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    HStack {
                        Text("회원가입")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        Text("배송을 위해 정보를 입력해주세요")
                            .font(.title2)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    VStack(spacing: 20) {
                        UserInfoCell(inputType: "이름", inputInfo: $name, inputStatus: $nameStatus)
                        
                        if nameStatus {
                            UserInfoCell(inputType: "주소", inputInfo: $address, inputStatus: $addressStatus)
                        }
                        
                        if nameStatus && addressStatus {
                            UserInfoCell(inputType: "휴대폰 번호", inputInfo: $hp, inputStatus: $hpStatus)
                        }
                    }
                    .padding(.vertical, 30)
                    
                }
                
                Spacer()
                
                if nameStatus && addressStatus && hpStatus {
                    Button(action: {}) {
                        Text("회원가입")
                            .fontWeight(.bold)
                            .frame(width: UIScreen.main.bounds.width * 4/5, height: 50)
                            .foregroundColor(.white)
                            .background(RoundedRectangle(cornerRadius: 15).foregroundColor(.yellow))
                            .shadow(radius: 3)
                    }
                }
            }
        }
    }
}

struct UserInfoCell: View {
    
    let inputType: String
    
    @Binding var inputInfo: String
    
    @Binding var inputStatus: Bool
    
    var body: some View {
        HStack {
            TextField(inputType, text: $inputInfo)
                .textFieldStyle(InputTextFieldStyle())
                .onTapGesture {
                    withAnimation {
                        inputStatus = false
                    }
                }
            
            Spacer()
                
            if !inputStatus {
                Button(action: {
                    withAnimation {
                        inputStatus = true
                    }
                }) {
                    Text("확인")
                        .frame(width: 80, height: 60)
                        .background(RoundedRectangle(cornerRadius:15).stroke(Color.gray.opacity(0.5), lineWidth: 2))
                }
            }
        }
        .padding(.horizontal)
    }
}

struct InputTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(20)
            .background(RoundedRectangle(cornerRadius: 15).stroke(Color.gray.opacity(0.5), lineWidth: 2))
    }
}

struct DividerSpace: View {
    var body: some View {
        ZStack {
            Color.gray.opacity(0.5)
        }
        .frame(width: UIScreen.main.bounds.width, height: 15)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
