import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        VStack(spacing: 16) {
            
            TextField("Email", text: $viewModel.mobileNumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            if viewModel.isLoading {
                ProgressView()
            }
            
            Button("Login") {
                viewModel.login()
            }
            .disabled(viewModel.mobileNumber.isEmpty || viewModel.password.isEmpty)
            
            if let error = viewModel.errorMessage {
                Text(error)
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
}
