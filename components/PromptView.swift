//
//  SwiftUIView.swift
//  
//
//  Created by 최명근 on 2023/03/29.
//

import SwiftUI

struct PromptView<Content>: View where Content: View {
    
    var title: String
    @ViewBuilder var content: () -> Content
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.system(size: 48))
                    .bold()
                Spacer()
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.forward")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .padding()
                        .foregroundColor(Color.white)
                }
                .buttonStyle(.borderedProminent)
                .clipShape(Circle())

            }
            .padding(36)
            
            Spacer()
            
            content()
            
            Spacer()
        }
    }
}

struct PromptView_Previews: PreviewProvider {
    static var previews: some View {
        PromptView(title: "asdf") {
            Text("asdf")
        }
    }
}
