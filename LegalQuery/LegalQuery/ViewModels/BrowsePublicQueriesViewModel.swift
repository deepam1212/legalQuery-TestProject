//
//  BrowsePublicQueriesViewModel.swift
//  LegalQuery
//
//  Created by Deepam Sharma on 3/9/26.
//

import SwiftUI
import CoreData

@Observable
class BrowsePublicQueriesViewModel {

    var queries: [Query] = []

    private let facade: QueryFacade

    init(context: NSManagedObjectContext) {
        self.facade = QueryFacade(context: context)
    }

    func loadPublicQueries() {
        queries = facade.getPublicQueries()
    }
}
