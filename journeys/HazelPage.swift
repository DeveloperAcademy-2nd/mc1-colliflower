import SwiftUI

struct HazelPage: View {
    @State private var questions: [String] = ["나쁜 습관 때문에 아카데미 생활에 영향이 있었던 적이 있나요? \n⭐️⭐️⭐️", "슬기로운 아카데미 생활이 뭘까?\n⭐️⭐️⭐️⭐️⭐️", "변화를 위해선 어느 정도의 시간이 필요한가?\n⭐️","이 변화의 과정이 어떻게 하면 아카데미에서 가치 있게 활용될 수 있을까?\n⭐️⭐️⭐️⭐️","'변화'의 궁극적 가치란 무엇인가?\n⭐️⭐️"]
    
    
    @State private var showAlert: Bool = false
    @State private var nextPage: Bool = false
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        MiroView(title: "GROUP,REFINE AND PRIORITIZE", message: "궁금한 모든 질문들의 답을 얻기에는 우리에게 주어진 자원은 한계가 있습니다. \n중요성과 시급성을 고려해 우선순위를 정해주시면 됩니다.\n높은 우선순위를 받아서 바로 조사를 시작해야하는 질문들을 순서대로 위쪽으로 옮겨주세요.") {
            
            VStack {
                Spacer()
                    .frame(height: 60)
                Text("팀원들과 상의하여 GQ의 우선순위를 정해보아요.")
                    .font(.system(size:30))
                Spacer()
                    .frame(height: 60)
                List {
                    ForEach(questions, id: \.self) { question in
                        ZStack {
                            Rectangle()
                                .fill(Color.white)
                                .frame(width: UIScreen.main.bounds.width, height: 150)
                                .border(Color.green, width: 4)
                            Text(question)
                                .font(.system(size: 40))
                                .multilineTextAlignment(.center)
                        }
                    }
                    .onMove {
                        questions.move(fromOffsets: $0, toOffset: $1)
                        questions.move(fromOffsets: $0, toOffset: $1)
                    }
                }
                .listStyle(.plain)
                
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Text("Back")
                            .font(.system(size: 32))
                    }
                    .foregroundColor(Color(uiColor: .placeholderText))
                    
                    
                    Spacer()
                    Button {
                        questions.shuffle()
                    } label: {
                        Text("Reset")
                            .font(.system(size: 32))
                    }
                    
                    Spacer()
                        .frame(width: 36)
                    
                    Button {
                        showAlert = true
                    } label: {
                        Text("Done")
                            .font(.system(size: 32))
                        
                    }
                    //                        .disabled(weightSum < 100)
                    .buttonStyle(.borderedProminent)
                    .sheet(isPresented: $showAlert) {
                        nextPage = true
                    } content: {
                        PromptView(title: "PRIORITIZE") {
                            Text("우선순위에 정답은 없답니다!")
                                .font(.system(size: 45))
                                .bold()
                                .padding(30)
                            
                            Text("각자 생각하는 우선순위가 다를 수 있어요.")
                                .font(.system(size: 20))
                            Text("우리가 왜 우선순위를 정했나요? 제한된 시간을 효율적으로 사용하기 위해서였죠!")
                                .font(.system(size: 20))
                            Text("앞으론 이 목적을 잊지말고 '적절한' 시간과 협의를 통해 우선순위를 정해보아요.")
                                .font(.system(size: 20))
                            
                            Image("mirohazel")
                                .resizable()
                                .scaledToFit()
                            //                                .frame(width: 650, height: 750)
                                .padding(50)
                        }
                    }
                    
                }
                .padding(20)
            }
        }
        
        NavigationLink("", isActive: $nextPage, destination: {
            SodaPage()
        })
        
        .toolbar { EditButton().foregroundColor(.white) }
    }
}

