//
//  QueryListView.swift
//  LegalQuery
//
//  Created by Deepam Sharma on 3/9/26.
//

import SwiftUI
import CoreData

struct QueryListView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(AuthViewModel.self) private var authViewModel
    
    @State private var viewModel: QueryListViewModel
    
    init(context: NSManagedObjectContext) {
        _viewModel = State(initialValue: QueryListViewModel(context: context))
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                AppBackgroundView()
                
                VStack(spacing: 18) {
                    
                    Image(systemName: "list.bullet.rectangle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 90, height: 90)
                        .foregroundColor(.blue)
                        .padding(.top, 20)
                    
                    Text(LoginViewConstants.kLegalQueryApp)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    if viewModel.queries.isEmpty {
                        Text(QueryListConstants.kNoQueriesAvailable)
                            .foregroundColor(.gray)
                            .padding()
                    } else {
                        List {
                            ForEach(viewModel.queries) { query in
                                VStack(alignment: .leading, spacing: 6) {
                                    
                                    Text(query.title ?? "")
                                        .font(.headline)
                                    
                                    Text(query.queryDescription ?? "")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                .padding(.vertical, 6)
                            }
                        }
                        .listStyle(.plain)
                    }
                    
                    Spacer()
                }
                .padding(24)
            }
            .navigationTitle(QueryListConstants.kQueries)
            .toolbar {
                
                // Create Query
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        CreateQueryView(context: viewContext)
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                
                // Logout
                ToolbarItem(placement: .topBarLeading) {
                    Button("Logout") {
                        authViewModel.isLoggedIn = false
                    }
                }
            }
            .onAppear {
                viewModel.loadQueries()
            }
        }
    }
}

#Preview {
    QueryListView(
        context: PersistenceController.shared.container.viewContext
    )
}
