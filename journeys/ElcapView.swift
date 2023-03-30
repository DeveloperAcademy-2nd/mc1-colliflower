//
//  SwiftUIView.swift
//  
//
//  Created by 최명근 on 2023/03/29.
//

import SwiftUI

struct ElcapView: View {
    
    @State private var selected: [ChallengeKeyword] = []
    @State private var weightSum: Int = 0
    @State private var progress: Float = 0.0
    
    @State private var showAlert: Bool = false
    @State private var bye: Float = 0.0
    
    @State private var showPrompt: Bool = false
    @State private var nextPage: Bool = false
    
    private var keywords: [ChallengeKeyword] = ChallengeKeywordDataSource.keywords
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        MiroView(title: "OUR CHALLENGE", message: "1. 개인적으로 의미가 있는 챌린지인가요?\n2. 앞으로 2주동안 이 챌린지를 수행하기에 충분히 동기가 부여되었나요?\n3. 이 챌린지를 수행하면서 많은 것들을 배울 수 있어보이나요?") {
            
            // MARK: - Content View
            VStack {
                
                
                // MARK: Selected Keywords
                VStack {
                    // Instruction
                    HStack {
                        Text("주제에 대한 키워\n드를 선택하세요.")
                            .font(.system(size: 48, weight: .bold))
                            .bold()
                        Spacer()
                    }
                    
                    // 선택된 키워드 태그
                    RoundedCornerView(backgroundColor: Color(uiColor: .secondarySystemBackground), cornerRadius: 36) {
                        ZStack {
                            
                            ScrollView(.horizontal) {
                                LazyHStack {
                                    ForEach(selected) { select in
                                        ChipView {
                                            Text(select.text)
                                                .font(.system(size: 21))
                                                .padding(16)
                                        }
                                    }
                                }
                                .padding([.leading], 8)
                            }
                            
                            
                            // Bye Animation
                            if bye > 0 {
                                HStack {
                                    Image(systemName: "hand.wave.fill")
                                        .resizable()
                                        .frame(width: 128, height: 128)
                                    Text("Bye~")
                                        .font(.system(size: 64))
                                }
                                .onAppear {
                                    withAnimation {
                                        bye = 0.0
                                    }
                                }
                                
                            }
                        }
                    }
                    .frame(height: 108)
                }
                
                
                // MARK: Progress Bar
                VStack {
                    ProgressView(value: progress)
                    HStack {
                        Text("진행율")
                            .font(.system(size: 21))
                        Spacer()
                        Spacer()
                        Spacer()
                        Text("Challenge\nStatement")
                            .font(.system(size: 21))
                            .foregroundColor(.red)
                        Spacer()
                        Text("Solution")
                            .font(.system(size: 21))
                            .foregroundColor(.green)
                    }
                }
                .padding(8)
                .padding([.top], 20)
                
                
                // MARK: 키워드 태그
                ScrollView {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 160))]) {
                        ForEach(keywords) { keyword in
                            ChipView(backgroundColor: selected.contains(where: { $0.text == keyword.text }) ? Color(uiColor: .secondarySystemBackground) : Color(uiColor: .tertiarySystemBackground)) {
                                Text(keyword.text)
                                    .font(.system(size: 21))
                                    .padding(16)
                            }
                            .onTapGesture {
                                if selected.contains(where: { $0.text == keyword.text }) {
                                    withAnimation {
                                        selected.removeAll(where: { $0.text == keyword.text })
                                    }
                                } else {
                                    withAnimation {
                                        selected.append(keyword)
                                    }
                                }
                                
                                withAnimation {
                                    calculateProgress()
                                }
                            }
                        }
                    }
                }
                
                // MARK: - Navigation Buttons
                HStack {
                    Button {
                        if progress <= 0.8 {
                            showPrompt = true
                        } else {
                            showAlert = true
                        }
                    } label: {
                        Text("다음")
                            .font(.system(size: 32))
                    }
                    .foregroundColor(Color(uiColor: .placeholderText))
                    .sheet(isPresented: $showPrompt) {
                        nextPage = true
                        
                    } content: {
                        PromptView(title: "CHALLENGE STATEMENT") {
                            Text("hello, world!")
                        }
                    }
                    .alert("오류!", isPresented: $showAlert) {
                        Button("확인하지 않기", role: .destructive) {
                            showAlert = false
                        }
                        Button("부정의 부정", role: .none) {
                            showAlert = false
                        }
                    } message: {
                        Text("Challenge Statement에는 Solution이 포함되지 않는 것이 좋습니다.\n\n우리 팀이 나아가야 할 대략적인 방향만을 정해보세요. 이에 동의하지 않지 않으신가요?")
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
                        self.selected.removeAll()
                        calculateProgress()
                        bye = 1.0
                    } label: {
                        Image(systemName: "hand.wave.fill")
                            .resizable()
                            .frame(width: 64, height: 64)
                    }
                    .disabled(weightSum < 100)
                    .buttonStyle(.borderedProminent)
                    
                }
                
            }
            .padding(20)
            
            
            NavigationLink("", isActive: $nextPage) {
                JunyooPage()
            }
            
        }
    }
    
    
    // MARK: - Progress 계산
    private func calculateProgress() {
        var weightSum = 0
        for s in selected {
            weightSum += s.weight
        }
        if weightSum > 100 {
            self.progress = 1.0
        } else if weightSum < 0 {
            self.progress = 0.0
        } else {
            self.progress = Float(weightSum) / 100
        }
        
        self.weightSum = weightSum
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ElcapView()
    }
}


// MARK: - ChallengeKeyword
struct ChallengeKeyword: Identifiable {
    var id: UUID = UUID()
    var text: String
    var weight: Int
}


// MARK: - ChallengeKeyword
class ChallengeKeywordDataSource {
    static let keywords: [ChallengeKeyword] = [
        ChallengeKeyword(text: "변화", weight: 20),
        ChallengeKeyword(text: "가치", weight: 5),
        ChallengeKeyword(text: "알찬", weight: 10),
        ChallengeKeyword(text: "디스코드", weight: 100),
        ChallengeKeyword(text: "기회", weight: 10),
        ChallengeKeyword(text: "노션", weight: 100),
        ChallengeKeyword(text: "모임", weight: 100),
        ChallengeKeyword(text: "습관", weight: 40),
        ChallengeKeyword(text: "아카데미", weight: 1),
        ChallengeKeyword(text: "혼자", weight: 5),
        ChallengeKeyword(text: "같이", weight: 5),
        ChallengeKeyword(text: "일상", weight: 5),
        ChallengeKeyword(text: "칭찬", weight: 5),
        ChallengeKeyword(text: "플랫폼", weight: 70),
        ChallengeKeyword(text: "생활패턴", weight: 20),
        ChallengeKeyword(text: "슬아생", weight: 20),
        ChallengeKeyword(text: "긍정적인", weight: 30),
        ChallengeKeyword(text: "부정적인", weight: 30),
        ChallengeKeyword(text: "새로운", weight: 70),
        ChallengeKeyword(text: "개선", weight: 70),
        ChallengeKeyword(text: "게임", weight: 10),
        ChallengeKeyword(text: "독서", weight: 5),
        ChallengeKeyword(text: "활동", weight: 10),
        ChallengeKeyword(text: "건강", weight: 30)
    ]
}

