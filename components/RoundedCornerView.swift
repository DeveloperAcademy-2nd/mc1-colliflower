//
//  File.swift
//  
//
//  Created by 최명근 on 2023/03/28.
//

import Foundation
import SwiftUI

// MARK: - RoundedCornerView
struct RoundedCornerView<Content>: View where Content: View {
    var backgroundColor: Color = Color(uiColor: UIColor.secondarySystemBackground)
    var cornerRadius: CGFloat = 8.0
    var shadowColor: Color = Color.black.opacity(0.3)
    var shadowRadius: CGFloat = 0
    var corners: UIRectCorner? = nil
    
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        HStack {
            content()
        }.padding(EdgeInsets(top: 12, leading: 8, bottom: 12, trailing: 8))
            .background(
                Rectangle()
                    .fill(backgroundColor)
                    .cornerRadius(cornerRadius, corners: corners != nil ? corners! : .allCorners)
                    .shadow(color: shadowColor, radius: shadowRadius, y: shadowRadius == 0 ? 0 : shadowRadius / 2)
            )
    }
    
}
