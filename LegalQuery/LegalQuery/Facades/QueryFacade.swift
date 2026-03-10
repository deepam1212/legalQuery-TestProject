//
//  QueryFacade.swift
//  LegalQuery
//
//  Created by Deepam Sharma on 3/9/26.
//

import Foundation
import CoreData

class QueryFacade {

    private let repository: QueryRepositoryProtocol

    init(context: NSManagedObjectContext) {
        self.repository = QueryRepository(context: context)
    }

    func createQuery(title: String,
                     description: String,
                     isPublic: Bool) {

        repository.createQuery(
            title: title,
            description: description,
            isPublic: isPublic
        )
    }

    func getQueries() -> [Query] {
        repository.fetchQueries()
    }
    
    func getPublicQueries() -> [Query] {
        repository.fetchPublicQueries()
    }
}
