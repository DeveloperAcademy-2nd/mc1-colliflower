//
//  SwiftUIView.swift
//  
//
//  Created by 최명근 on 2023/03/30.
//

import SwiftUI
import AVFoundation

struct TiramisuView: View {
    
    @State private var index: Int = 0
    private let images: [String] = ["tiramisu_1", "tiramisu_2", "tiramisu_3", "tiramisu_4", "tiramisu_5"]
    private let scripts: [String] = [
    "오늘은 나일라의 생일이에요.",
    "콜리플라워 모두가 나일라의 생일을 축하하기 위해 모였어요! 와~ 티라미수도 준비했네요.",
    "그런데 그만, 나일라가 초를 끄기 위해 티라미수를 불고야 말았어요.",
    "결국 바닥이 티라미수 가루로 초토화되었지만, 그래도 행복한 생일축하였답니다.",
    "생일축하해 나일라~"
    ]
    private let synthesizer = AVSpeechSynthesizer()
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Image(images[index])
            .resizable()
            .aspectRatio(contentMode: .fit)
            .onAppear {
                Task {
                    for i in 0..<images.count {
                        index = i
                        speak()
                        while synthesizer.isSpeaking {
                            try await Task.sleep(nanoseconds: 1_000_000_000)
                        }
                    }
                    
                    dismiss()
                }
            }
    }
    
    private func speak() {
        let soundText = AVSpeechUtterance(string: scripts[index])
        soundText.voice = AVSpeechSynthesisVoice(language: "ko-KR")
        synthesizer.speak(soundText)
        
    }
}

struct TiramisuView_Previews: PreviewProvider {
    static var previews: some View {
        TiramisuView()
    }
}
