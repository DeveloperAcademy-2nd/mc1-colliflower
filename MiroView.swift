//
//  MiroView.swift
//  Colli-Flower
//
//  Created by 최명근 on 2023/03/27.
//

import Foundation
import SwiftUI

struct MiroView<Content>: View where Content: View {
    
    @State var title: String = ""
    @State var message: String = ""
    
    @ViewBuilder var content: () -> Content
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 0) {
            // MARK: - Title
            HStack {
                // Back Button
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.backward")
                }
                .foregroundColor(Color.white)

                Spacer()
                // Title
                Text(title)
                    .font(.title)
                    .foregroundColor(Color.white)
                Spacer()
            }
            .padding(8)
            .background(
                Color.green.ignoresSafeArea(.all)
            )
            
            // MARK: - Message (or instructions)
            if !message.isEmpty {
                HStack {
                    HStack {
                        Text(message)
                            .padding(16)
                        Spacer()
                    }
                }
                .border(Color.green, width: 2)
            }
            
            Spacer()
            
            // MARK: - Content
            VStack {
                content()
            }
            
            Spacer()
        }
        .border(Color.green, width: 2)
        .navigationBarBackButtonHidden(true)
    }
    
}

struct MiroView_Previews: PreviewProvider {
    static var previews: some View {
        MiroView {
            Text("Hello, world!")
                
        }
        .previewInterfaceOrientation(.landscapeLeft)
        .previewDevice("iPad Pro (12.9-inch) (6th generation)")
    }
}

