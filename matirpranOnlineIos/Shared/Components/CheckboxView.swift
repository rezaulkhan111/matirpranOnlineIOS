
import SwiftUI

struct CheckboxView: View {
    
    let title: String
    @Binding var isChecked: Bool
    
    var body: some View {
        Button(action: {
            isChecked.toggle()
        }) {
            HStack(spacing: 10) {
                
                Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                    .foregroundColor(isChecked ? .blue : .gray)
                
                Text(title)
                    .foregroundColor(.primary)
                
                Spacer()
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}
