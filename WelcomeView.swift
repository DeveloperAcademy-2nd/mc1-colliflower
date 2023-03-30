//
//  WelcomeView.swift
//  Colli-Flower
//
//  Created by 최명근 on 2023/03/28.
//

import SwiftUI

struct WelcomeView: View {
    
    @State private var c: String = "ㅅ"
    @State private var b: String = "ㅂ"
    @State private var l: String = "ㅇ"
    
    @State private var next: Bool = false
    @State private var nextActive: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("우리의")
                        .font(.system(size: 64))
                    Spacer()
                }
                
                HStack {
                    Text(c)
                        .foregroundColor(Color("ColorC"))
                    Text(b)
                        .foregroundColor(Color("ColorB"))
                    Text(l)
                        .foregroundColor(Color("ColorL"))
                }
                .font(.system(size: 186).bold())
                .onTapGesture {
                    withAnimation {
                        if !next {
                            c = "C "
                            b = " B "
                            l = " L"
                            next = true
                        } else {
                            nextActive = true
                        }
                    }
                }
                
                NavigationLink("", isActive: $nextActive) {
                    ElcapView()
                }
                
                HStack {
                    Spacer()
                    Text("이야기")
                        .font(.system(size: 64))
                }
            }
            .frame(width: 512)
        }
        .navigationViewStyle(.stack)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
