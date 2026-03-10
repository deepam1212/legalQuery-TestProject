//
//  BrowsePublicQueriesView.swift
//  LegalQuery
//
//  Created by Deepam Sharma on 3/9/26.
//

import SwiftUI
import CoreData

struct BrowsePublicQueriesView: View {

    @Environment(\.managedObjectContext) private var context
    @State private var viewModel: BrowsePublicQueriesViewModel

    init(context: NSManagedObjectContext) {
        _viewModel = State(initialValue: BrowsePublicQueriesViewModel(context: context))
    }

    var body: some View {
        NavigationStack {
            ZStack {

                AppBackgroundView()

                VStack(spacing: 18) {

                    Image(systemName: "text.bubble.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 90, height: 90)
                        .foregroundColor(.blue)

                    Text(BrowsePublicQueriesConstants.kPublicQueries)
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    if viewModel.queries.isEmpty {
                        Text(BrowsePublicQueriesConstants.kNoPublicQueriesAvailable)
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
            .onAppear {
                viewModel.loadPublicQueries()
            }
        }
    }
}

#Preview {
    BrowsePublicQueriesView(context: PersistenceController.shared.container.viewContext)
}
