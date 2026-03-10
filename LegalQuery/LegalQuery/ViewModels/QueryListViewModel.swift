//
//  QueryListViewModel.swift
//  LegalQuery
//
//  Created by Deepam Sharma on 3/9/26.
//

import Foundation
import SwiftUI
import CoreData

@Observable
class QueryListViewModel {

    var queries: [Query] = []

    private let facade: QueryFacade

    init(context: NSManagedObjectContext) {
        self.facade = QueryFacade(context: context)
    }

    func loadQueries() {
        queries = facade.getQueries()
    }
}
