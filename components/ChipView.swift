//
//  File.swift
//  
//
//  Created by 최명근 on 2023/03/28.
//

import Foundation
import SwiftUI

struct ChipView<Content>: View where Content: View {
    var backgroundColor: Color = Color(uiColor: .tertiarySystemBackground)
    
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        HStack {
            content()
        }.padding(EdgeInsets(top: 6, leading: 16, bottom: 6, trailing: 16))
            .background(
                ZStack {
                    GeometryReader { geometry in
                        RoundedRectangle(cornerRadius: geometry.size.height / 2)
                            .foregroundColor(backgroundColor)
                            .shadow(color: Color.black.opacity(0.2), radius: 2, y: 2)
                        RoundedRectangle(cornerRadius: geometry.size.height / 2)
                            .strokeBorder(backgroundColor, style: StrokeStyle(lineWidth: 1))
                            .foregroundColor(Color.clear)
                    }
                }
            )
    }
}
