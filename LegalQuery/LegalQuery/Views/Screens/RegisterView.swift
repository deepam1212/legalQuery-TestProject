//
//  RegisterView.swift
//  LegalQuery
//
//  Created by Deepam Sharma on 3/9/26.
//

import SwiftUI
import CoreData

struct RegisterView: View {

    @Environment(\.managedObjectContext) private var context
    @State private var viewModel: RegisterViewModel

    init(context: NSManagedObjectContext) {
        _viewModel = State(initialValue: RegisterViewModel(context: context))
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

                    TextField(RegisterViewConstants.kName, text: $viewModel.name)
                        .padding()
                        .frame(height: 55)
                        .background(.white)
                        .cornerRadius(10)

                    TextField(RegisterViewConstants.kEmail, text: $viewModel.email)
                        .padding()
                        .frame(height: 55)
                        .background(.white)
                        .cornerRadius(10)

                    SecureField(RegisterViewConstants.kPassword, text: $viewModel.password)
                        .padding()
                        .frame(height: 55)
                        .background(.white)
                        .cornerRadius(10)

                    SecureField(RegisterViewConstants.kConfirmPassword, text: $viewModel.confirmPassword)
                        .padding()
                        .frame(height: 55)
                        .background(.white)
                        .cornerRadius(10)

                    Button {
                        viewModel.registerUser()
                    } label: {
                        Text(RegisterViewConstants.kRegister)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }

                    if viewModel.showError {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }

                    Spacer()
                }
                .padding(24)
            }
        }
    }
}

#Preview {
    RegisterView(context: PersistenceController.shared.container.viewContext)
}
