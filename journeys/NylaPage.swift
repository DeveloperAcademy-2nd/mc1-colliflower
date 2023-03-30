//
//  SwiftUIView.swift
//  
//
//  Created by 최명근 on 2023/03/29.
//

import SwiftUI

struct NylaPage: View {
    @State private var isOn: Bool = true
    
    @State private var c1r1: Bool = true
    @State private var c1r2: Bool = true
    @State private var c1r3: Bool = true
    @State private var c1r4: Bool = true
    @State private var c1r5: Bool = true
    
    @State private var c2r1: Bool = true
    @State private var c2r2: Bool = true
    @State private var c2r3: Bool = true
    @State private var c2r4: Bool = true
    @State private var c2r5: Bool = true
    
    @State private var c3r1: Bool = true
    @State private var c3r2: Bool = true
    @State private var c3r3: Bool = true
    @State private var c3r4: Bool = true
    @State private var c3r5: Bool = true
    
    @State private var showPrompt: Bool = false
    @State private var nextPage: Bool = false
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        MiroView(title: "Our Challenge", message: "To-do 리스트를 세 가지 선택하세요.") {
            
            VStack {
                
                Spacer()
                
                Text("MC1 To-do List")
                    .font(.system(size: 56))
                
                HStack {
                    
                    VStack(spacing: 20) {
                        NylaView(isOn: $c1r1, toDoContent: "세션 참여하기")
                        NylaView(isOn: $c1r2, toDoContent: "의견 공유하기")
                        NylaView(isOn: $c1r3, toDoContent: "결론 내지 않기")
                        NylaView(isOn: $c1r4, toDoContent: "설문조사 하기")
                        NylaView(isOn: $c1r5, toDoContent: "인터뷰 하기")
                    }
                    
                    VStack(spacing: 20) {
                        NylaView(isOn: $c2r1, toDoContent: "구체화 하기")
                        NylaView(isOn: $c2r2, toDoContent: "회의 하기")
                        NylaView(isOn: $c2r3, toDoContent: "워크샵 듣기")
                        NylaView(isOn: $c2r4, toDoContent: "티라미수 먹기")
                        NylaView(isOn: $c2r5, toDoContent: "멘토 피드백 받기")
                    }
                    
                    VStack(spacing: 20) {
                        NylaView(isOn: $c3r1, toDoContent: "발표 하기")
                        NylaView(isOn: $c3r2, toDoContent: "발표자료 만들기")
                        NylaView(isOn: $c3r3, toDoContent: "주제 변경하기")
                            .onChange(of: c3r3) { newValue in
                                turnAllOn()
                            }
                        NylaView(isOn: $c3r4, toDoContent: "아이디어 내기")
                        NylaView(isOn: $c3r5, toDoContent: "다시 선택하기")
                            .onChange(of: c3r5) { newValue in
                                turnAllOn()
                            }
                            
                    }
                }

                .padding([.top], 48)
                
                Spacer()
                
                HStack {
                    Button {
                        showPrompt = true
                    } label: {
                        Text("다음")
                            .font(.system(size: 32))
                    }
                    .foregroundColor(Color(uiColor: .placeholderText))
                    .sheet(isPresented: $showPrompt) {
                        nextPage = true
                    } content: {
                        PromptView(title: "") {
                            // TODO: asdkfjaslkdfjlasdkjf
                        }
                    }

                    
                    Spacer()
                    Button {
                        dismiss()
                    } label: {
                        Text("이전")
                            .font(.system(size: 32))
                    }
                    
                    Spacer()
                        .frame(width: 36)
                    
                    Button {
                        turnAllOn()
                    } label: {
                        Text("reset")
                            .font(.system(size: 32))
                    }
//                        .disabled(weightSum < 100)
                    .buttonStyle(.borderedProminent)
                    
                }
                .padding(20)
            }
            
            NavigationLink("", isActive: $nextPage) {
                // TODO: 끝
            }
        }
    }
    
    private func turnAllOn() {
        c1r1 = true
        c1r2 = true
        c1r3 = true
        c1r4 = true
        c1r5 = true
        
        c2r1 = true
        c2r2 = true
        c2r3 = true
        c2r4 = true
        c2r5 = true
        
        c3r1 = true
        c3r2 = true
        c3r3 = true
        c3r4 = true
        c3r5 = true
    }
}

struct NylaPage_Previews: PreviewProvider {
    static var previews: some View {
        NylaPage()
    }
}
