//
//  SwiftUIView.swift
//  
//
//  Created by 최명근 on 2023/03/29.
//

import SwiftUI

struct NavigationStackWrapper<Content>: View where Content: View {
    
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        if #available(iOS 16, *) {
            NavigationStack {
                content()
            }
        } else {
            NavigationView {
                content()
            }
        }
    }
}
