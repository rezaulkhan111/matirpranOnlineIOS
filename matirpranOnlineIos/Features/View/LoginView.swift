import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
    @State private var isRemember: Bool=false
    
    var body: some View {
        VStack(spacing: 16) {
            Image("ic_launcher_logo")
                .resizable()
                .scaledToFit()
                .frame(width: 220,height: 120)
            
            Text("Welcome back")
                .font(Font.headline)
            Text("Login back into your account")
            
            TextField("Email", text: $viewModel.mobileNumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            HStack(spacing:20){
                CheckboxView(title: "Remember", isChecked: $isRemember)
                
                Text("Forgot Password?")
            }
            
            
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
