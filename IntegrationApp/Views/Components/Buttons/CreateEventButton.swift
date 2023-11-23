import SwiftUI

struct CreateEventButton<T: View>: View {
    @State private var isSheetPresented = false
    @State private var isEventViewPresented = false
    @State private var tutorialState: TutorialState = .introduction
    @Environment (\.screenSize) var screenSize
    let view: T
    

   var body: some View {
       Button(action: {
           isSheetPresented.toggle()
       }) {
           Circle()
               .foregroundColor(Color.plusButton)
               .frame(width: screenSize.width * 0.12, height: screenSize.height * 0.12)
               .overlay(
                  Image(systemName: "plus")
                    .font(.system(size: 25, weight: .regular))
                      .foregroundColor(.white)
               )
       }
       .sheet(isPresented: $isSheetPresented, content: {
           self.view
//           SheetCreateEvent(closeAndDisplayEventView: {
//               self.isSheetPresented = false
//               
////               DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
////                   self.isEventViewPresented = true
////               }
//               
//           })
       })
//       .fullScreenCover(isPresented: $isEventViewPresented) {
//           EventView(tutorialState: $tutorialState)
//       }
   }
}
