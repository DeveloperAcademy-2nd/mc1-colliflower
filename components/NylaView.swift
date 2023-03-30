//
//  NylaView.swift
//  Colli-Flower
//
//  Created by Nayun Kim on 2023/03/28.
//

import SwiftUI

struct NylaView: View {
    @Binding var isOn: Bool
    var toDoContent: String
    
    var body: some View {
        
        Button {
            isOn.toggle()
        } label: {
            
            HStack {
                if isOn {
                    Image(systemName: "checkmark.square")
                        .resizable()
                        .frame(width: 48, height: 48)
                        .foregroundColor(Color.accentColor)
                } else {
                    Image(systemName: "square")
                        .resizable()
                        .frame(width: 48, height: 48)
                        .foregroundColor(Color.accentColor)
                }
                Text(toDoContent)
                    .font(.system(size: 36))
                
            }
        }
        .foregroundColor(Color.black)
    }
}

struct NylaView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
