import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            MiroView(title: "Title", message: "Message") {
                
                Text("여기에 코드를 작성하세요!")
                
            }
        }
        .navigationViewStyle(.stack)
    }
}
