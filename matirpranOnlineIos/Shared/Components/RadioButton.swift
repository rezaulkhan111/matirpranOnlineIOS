import SwiftUI

struct RadioButton: View {
    
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: isSelected ? "largecircle.fill.circle" : "circle")
                Text(title)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}
