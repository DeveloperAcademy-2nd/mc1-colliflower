//
//  SwiftUIView.swift
//  
//
//  Created by 최명근 on 2023/03/30.
//

import SwiftUI

struct EndingPage: View {
    
    @State private var c: String = "ㅅ"
    @State private var b: String = "ㅂ"
    @State private var l: String = "ㅇ"
    
    @State private var next: Bool = false
    @State private var qr: Bool = false
    
    var body: some View {
        VStack {
            
            Spacer()
            
            HStack {
                Text("우리의")
                    .font(.system(size: 64))
                Spacer()
            }
            
            if next && qr {
                HStack {
                    Image("early-debug")
                        .resizable()
                        .frame(width: 256, height: 256)
                    Image("discord_qr")
                        .resizable()
                        .frame(width: 256, height: 256)
                }
                .onTapGesture {
                    withAnimation {
                        c = "ㅅ"
                        b = "ㅂ"
                        l = "ㅇ"
                        
                        next = false
                        qr = false
                    }
                }
            } else {
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
                            qr = true
                        }
                        
                    }
                }
            }
            
            HStack {
                Spacer()
                Text("이야기")
                    .font(.system(size: 64))
            }
            
            Spacer()
            
            Text("~ THE END ~")
                .font(.system(size: 48).bold())
        }
        .frame(width: 512)
    }
}

struct EndingPage_Previews: PreviewProvider {
    static var previews: some View {
        EndingPage()
    }
}
