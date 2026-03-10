//
//  QueryRepository.swift
//  LegalQuery
//
//  Created by Deepam Sharma on 3/9/26.
//

import Foundation
import CoreData

protocol QueryRepositoryProtocol {
    func createQuery(title: String, description: String, isPublic: Bool)
    func fetchQueries() -> [Query]
    func fetchPublicQueries() -> [Query]
}

class QueryRepository: QueryRepositoryProtocol {

    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
    }

    func createQuery(title: String, description: String, isPublic: Bool) {
        let query = Query(context: context)
        query.id = UUID()
        query.title = title
        query.queryDescription = description
        query.isPublic = isPublic
        query.createdAt = Date()

        try? context.save()
    }

    func fetchPublicQueries() -> [Query] {
        let request: NSFetchRequest<Query> = Query.fetchRequest()
        request.predicate = NSPredicate(format: "isPublic == YES")
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Query.createdAt, ascending: false)]

        return (try? context.fetch(request)) ?? []
    }
    
    func fetchQueries() -> [Query] {
        let request: NSFetchRequest<Query> = Query.fetchRequest()
        return (try? context.fetch(request)) ?? []
    }
}
