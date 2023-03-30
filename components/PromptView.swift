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
                    .font(.system(size: 68))
                    .bold()
                Spacer()
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 36, height: 36)
                        .padding()
                        .foregroundColor(Color.white)
                }
                .buttonStyle(.bordered)
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
