import SwiftUI

struct TitleComponent: View {
    let title: String
    
    var body: some View {
        Text(title)
//            .font(.largeTitle)
            .fontWeight(.bold)
    }
}

#Preview {
    TitleComponent(title: "")
}
