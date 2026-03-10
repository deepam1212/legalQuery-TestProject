//
//  LoginView.swift
//  LegalQuery
//
//  Created by Deepam Sharma on 3/9/26.
//

import SwiftUI
import CoreData

struct LoginView: View {
    
    @Environment(\.managedObjectContext) private var context
    @Environment(AuthViewModel.self) private var authViewModel
    
    @State private var viewModel: LoginViewModel
    
    init(context: NSManagedObjectContext) {
        _viewModel = State(initialValue: LoginViewModel(context: context))
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                AppBackgroundView()
                
                VStack(spacing: 18) {
                    
                    Image(systemName: "scale.3d")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 90, height: 90)
                        .foregroundColor(.blue)
                        .padding(.top, 20)
                    
                    Text(LoginViewConstants.kLegalQueryApp)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    TextField(LoginViewConstants.kEmail, text: $viewModel.email)
                        .padding()
                        .frame(height: 55)
                        .background(.white)
                        .cornerRadius(10)
                        .textInputAutocapitalization(.never)
                    
                    SecureField(LoginViewConstants.kPassword, text: $viewModel.password)
                        .padding()
                        .frame(height: 55)
                        .background(.white)
                        .cornerRadius(10)
                    
//                    The User, Deepam Sharma, has been created in IdentityNOW with the following password:

//                    G7WV!@*%lrk1ve9ub
                    Button(LoginViewConstants.kLogin) {
                        if viewModel.loginUser() {
                            authViewModel.isLoggedIn = true
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.top, 5)
                    
                    if viewModel.showError {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    NavigationLink(LoginViewConstants.kRegister) {
                        RegisterView(context: context)
                    }
                    .padding(.top, 5)
                    
                    NavigationLink(LoginViewConstants.kBrowsePublicQueries) {
                        BrowsePublicQueriesView(context: context)
                    }
                    
                    Spacer()
                }
                .padding(24)
            }
        }
    }
}

#Preview {
    LoginView(
        context: PersistenceController.shared.container.viewContext
    )
}
