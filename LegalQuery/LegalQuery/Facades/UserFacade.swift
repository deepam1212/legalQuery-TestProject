//
//  UserFacade.swift
//  LegalQuery
//
//  Created by Deepam Sharma on 3/9/26.
//

import CoreData

class UserFacade {

    private let repository: UserRepositoryProtocol

    init(context: NSManagedObjectContext) {
        self.repository = UserRepository(context: context)
    }

    func createUser(name: String, email: String, password: String) {
        repository.createUser(name: name, email: email, password: password)
    }
    
    func loginUser(email: String, password: String) -> Bool {
        repository.loginUser(email: email, password: password)
    }
}
