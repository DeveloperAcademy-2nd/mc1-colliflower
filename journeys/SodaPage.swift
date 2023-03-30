import SwiftUI

struct SodaPage: View {
    @State private var showing = false
    @State private var zoomButtonAnimationAmount: CGFloat = 1
    @State private var imageAnimtationAmount: CGFloat = 1
    @State private var firstEditor: String = ""
    @State private var secondEditor: String = ""
    @State private var thirdEditor: String = ""
    @State private var fourthEditor: String = ""
    
    @State private var showPrompt: Bool = false
    @State private var nextPage: Bool = false
    
    var body: some View {
        MiroView(title: "INVESTIGATE", message: "콜리플라워는 주제를 넓히고 좁히는 과정을 정말 많이 반복했습니다.\n이를 정리해 보기 위해 주요 키워드를 확대하여 살펴봅시다.") {
            
            HStack {
                VStack {
                    Spacer()
                    Button {
                        if zoomButtonAnimationAmount <= 5 {
                            zoomButtonAnimationAmount += 1
                        }
                    } label: {
                        Image(systemName: "plus.magnifyingglass")
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                    .scaleEffect(zoomButtonAnimationAmount)
                    .tint(.black)
                    .controlSize(.large)
                    Spacer()
                    Button {
                        if zoomButtonAnimationAmount > 1 {
                            zoomButtonAnimationAmount -= 1
                        }
                    } label: {
                        Image(systemName: "minus.magnifyingglass")
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                    .tint(.black)
                    .controlSize(.large)
                    Spacer()
                    Button {
                        if imageAnimtationAmount <= 6 {
                            imageAnimtationAmount += 1
                        }
                    } label: {
                        Image(systemName: "arrow.left.and.right.righttriangle.left.righttriangle.right")
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                    .tint(.black)
                    .controlSize(.large)
                    Spacer()
                    Button {
                        showing = true
                        zoomButtonAnimationAmount = 1
                        imageAnimtationAmount = 1
                    } label: {
                        Image(systemName: "house")
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                    .alert("정답 보시게요...?", isPresented: $showing) {
                        Button("미안......", role: .cancel) { }
                    }
                    .tint(.black)
                    .controlSize(.large)
                    Spacer()
                }
                .frame(width: 70, height: 400)
                .background(.white)
                .shadow(color: Color(red: 220/255, green: 220/255, blue: 220/255, opacity: 1), radius: 8, x: 0, y: 0)
                
                Spacer()
                
                VStack {
                    Spacer()
                    Image("KeywordImage")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70)
                        .scaleEffect(imageAnimtationAmount)
                        .padding(150)
                    
                    HStack {
                        TextEditor(text: $firstEditor)
                            .font(.system(size: 50))
                            .frame(width: 160, height: 160)
                            .background(.yellow)
                            .opacity(0.8)
                        TextEditor(text: $secondEditor)
                            .font(.system(size: 50))
                            .frame(width: 160, height: 160)
                            .background(.yellow)
                            .opacity(0.8)
                        TextEditor(text: $thirdEditor)
                            .font(.system(size: 50))
                            .frame(width: 160, height: 160)
                            .background(.yellow)
                            .opacity(0.8)
                        TextEditor(text: $fourthEditor)
                            .font(.system(size: 50))
                            .frame(width: 160, height: 160)
                            .background(.yellow)
                            .opacity(0.8)
                    }
                    
                    Spacer()
                    
                    HStack {
                        Button("ⓓONE") {
                            showPrompt = true
                        }
                        .font(.system(size: 20))
                        .foregroundColor(.gray)
                        .sheet(isPresented: $showPrompt) {
                            nextPage = true
                        } content: {
                            PromptView(title: "asdf") {
                                // TODO: asdfaskldfjaslkdjflaskjdfl
                            }
                        }

                        
                        Spacer()
                        Button {
                        } label: {
                            Text("cancel")
                                .font(.system(size: 25))
                                .foregroundColor(Color(uiColor: .placeholderText))
                        }
                        
                        Spacer()
                            .frame(width: 36)
                        
                        Button {
                            firstEditor = ""
                            secondEditor = ""
                            thirdEditor = ""
                            fourthEditor = ""
                        } label: {
                            Text("Delete")
                                .font(.system(size: 25))
                        }
                        .padding(.trailing, 50)
                        .buttonStyle(.borderedProminent)
                    }
                }
                
                Spacer()
            }
            NavigationLink("", isActive: $nextPage) {
                NylaPage()
            }
        }
    }
}
