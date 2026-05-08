import SwiftUI

struct ServiceButton: View {
    let imageName: String
       let title: String
       let action: () -> Void
       
       var body: some View {
           Button(action: action) {
               VStack {
                   Image(imageName)
                       .resizable()
                       .scaledToFit()
                       .frame(width: 150, height: 80)
                       .padding(10)
                   
                   Text(title)
                       .foregroundColor(.black)
                       .padding(10)
               }
               .background(Color.white)
               .cornerRadius(4)
               .padding(3)
           }
           .background(Color.green.opacity(0.3))
           .cornerRadius(4)
           .shadow(radius: 5)
           .padding(.top, 10)
           .padding(.leading, 10)
       }
}
