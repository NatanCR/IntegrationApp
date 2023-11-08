import SwiftUI

struct ScreenEvents: View {
    @State private var isSheetPresented = false
    @State private var title = ""
    @State private var selectedDate = Date()

    var body: some View {
        Button(action: {
            isSheetPresented.toggle()
        }) {
            Circle()
                .foregroundColor(Color.orange)
                .frame(width: 45, height: 50)
                .overlay(
                    Text("+")
                        .font(.system(size: 35, weight: .thin))
                        .foregroundColor(.white)
                        .position(x: 22.5, y: 22.5)
                )
        }
        .sheet(isPresented: $isSheetPresented, content: {
            SheetCreateEvent(title: $title, selectedDate: $selectedDate, isSheetPresented: $isSheetPresented)
        })
    }
}
