//
//  CreateQueryView.swift
//  LegalQuery
//
//  Created by Deepam Sharma on 3/9/26.
//

import SwiftUI
import CoreData

struct CreateQueryView: View {

    @Environment(\.managedObjectContext) private var context
    @State private var viewModel: CreateQueryViewModel

    init(context: NSManagedObjectContext) {
        _viewModel = State(initialValue: CreateQueryViewModel(context: context))
    }

    var body: some View {
        ZStack {

            AppBackgroundView()

            VStack(spacing: 18) {

                Image(systemName: "square.and.pencil")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90, height: 90)
                    .foregroundColor(.blue)

                Text(CreateQueryConstants.kCreateQuery)
                    .font(.largeTitle)
                    .fontWeight(.bold)

                TextField(CreateQueryConstants.kTitle, text: $viewModel.title)
                    .padding()
                    .frame(height: 55)
                    .background(.white)
                    .cornerRadius(10)

                TextField(CreateQueryConstants.kDescription, text: $viewModel.description)
                    .padding()
                    .frame(height: 55)
                    .background(.white)
                    .cornerRadius(10)

                Toggle(CreateQueryConstants.kPublicQuery, isOn: $viewModel.isPublic)
                    .padding()
                    .background(.white)
                    .cornerRadius(10)

                Button(CreateQueryConstants.kSubmitQuery) {
                    viewModel.createQuery()
                }
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(.blue)
                .foregroundColor(.white)
                .cornerRadius(10)

                if viewModel.showError {
                    Text(CreateQueryConstants.kAllFieldsRequired)
                        .foregroundColor(.red)
                }

                Spacer()
            }
            .padding(24)
        }
        .navigationTitle(CreateQueryConstants.kCreateQuery)
    }
}

#Preview {
    CreateQueryView(context: PersistenceController.shared.container.viewContext)
}
