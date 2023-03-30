//
//  SwiftUIView.swift
//  
//
//  Created by 최명근 on 2023/03/29.
//

import SwiftUI

struct JunyooPage: View {
    @State var junyooState: Double = 0
    @State var hazelState: Double = 0
    @State var elcapState: Double = 0
    @State var sodaState: Double = 0
    @State var nylaState: Double = 0
    
    let junyooLine: CGFloat = 30
    let hazelLine: CGFloat = 80
    let elcapLine: CGFloat = 64
    let sodaLine: CGFloat = 50
    let nylaLine: CGFloat = 44
    
    @State private var showPrompt: Bool = false
    @State private var nextPage: Bool = false
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        MiroView(title: "INVESTIGATE",
                 message: "팀 전체의 방향성을 존중하며 자신의 의견을 피력하는 것이 어렵지는 않았나요?\n팀원간 의견이 서로 맞지 않겠지만, 모두가 만족할 수 있는 타협점을 찾아보아요.") {
            VStack {
                HStack {
                    Text("팀원들의 의견을 조율해 보세요!")
                        .font(.title)
                        .padding(50)
                }
                HStack {
                    JunyooView(tiltAngle: .degrees(10), progress: $junyooState, personalLine: junyooLine, image: "junyoo")
                        .offset(x: -50)
                    JunyooView(tiltAngle: .degrees(-10), progress: $hazelState, personalLine: CGFloat(80), image: "hazel")
                        .offset(x: 50)
                }
                JunyooView(tiltAngle: .degrees(15), progress: $elcapState, personalLine: CGFloat(64), image: "elcap")
                HStack {
                    JunyooView(tiltAngle: .degrees(-15), progress: $sodaState, personalLine: CGFloat(50), image: "soda")
                        .offset(x: -50)
                    JunyooView(tiltAngle: .degrees(10), progress: $nylaState, personalLine: CGFloat(44), image: "nyla")
                        .offset(x: 50)
                }
            }
        }
        
        HStack {
            Button("ⓓONE") {
                showPrompt = true
            }
            .offset(x: 5, y: 30)
            .font(.system(size: 20))
            .foregroundColor(.gray)
            .sheet(isPresented: $showPrompt) {
                nextPage = true
            } content: {
                PromptView(title: "🥳WELL DONE!") {
					JunyooPromptView()
                }
            }

            
            Spacer()
            Button {
                dismiss()
            } label: {
                Text("cancel")
                    .font(.system(size: 25))
                    .foregroundColor(Color(uiColor: .placeholderText))
            }
            
            Spacer()
                .frame(width: 36)
            
            Button {
                resetState()
            } label: {
                Text("Shuffle")
                    .font(.system(size: 25))
            }
            .padding(.trailing, 50)
            .disabled(didAllStateGood())
            .buttonStyle(.borderedProminent)
        }
        
        NavigationLink("", isActive: $nextPage) {
            // TODO: Next Page
            HazelPage()
        }
    }
    
    func didAllStateGood() -> Bool {
        var flag = 0
        
        if junyooState/3.6 <= 35 && junyooState/3.6 >= 25 { flag += 1 } else { flag -= 1}
        if hazelState/3.6 <= 85 && hazelState/3.6 >= 75 { flag += 1 } else { flag -= 1}
        if elcapState/3.6 <= 69 && elcapState/3.6 >= 59 { flag += 1 } else { flag -= 1}
        if sodaState/3.6 <= 55 && sodaState/3.6 >= 45 { flag += 1 } else { flag -= 1}
        if nylaState/3.6 <= 49 && nylaState/3.6 >= 39 { flag += 1 } else { flag -= 1}
        
        if flag == 5 {
            return false
        }
        return true
    }
    func resetState() {
        junyooState = 0
        hazelState = 0
        elcapState = 0
        sodaState = 0
        nylaState = 0
    }
    
}

struct JunyooPage_Previews: PreviewProvider {
    static var previews: some View {
		JunyooPromptView()
    }
}
