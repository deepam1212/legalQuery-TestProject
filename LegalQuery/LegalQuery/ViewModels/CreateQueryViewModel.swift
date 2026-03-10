//
//  CreateQueryViewModel.swift
//  LegalQuery
//
//  Created by Deepam Sharma on 3/9/26.
//

import SwiftUI
import CoreData

@Observable
class CreateQueryViewModel {

    var title = ""
    var description = ""
    var isPublic = true
    var showError = false

    private let facade: QueryFacade

    init(context: NSManagedObjectContext) {
        self.facade = QueryFacade(context: context)
    }

    func createQuery() {
        guard !title.isEmpty, !description.isEmpty else {
            showError = true
            return
        }

        facade.createQuery(
            title: title,
            description: description,
            isPublic: isPublic
        )

        title = ""
        description = ""
        isPublic = true
    }
}
