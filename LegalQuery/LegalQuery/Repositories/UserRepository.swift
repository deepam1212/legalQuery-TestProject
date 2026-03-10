//
//  UserRepository.swift
//  LegalQuery
//
//  Created by Deepam Sharma on 3/9/26.
//

import CoreData

protocol UserRepositoryProtocol {
    func createUser(name: String, email: String, password: String)
    func loginUser(email: String, password: String) -> Bool
}

class UserRepository: UserRepositoryProtocol {

    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
    }

    func createUser(name: String, email: String, password: String) {

        let user = User(context: context)
        user.id = UUID()
        user.name = name
        user.email = email
        user.password = password

        try? context.save()
    }
    
    func loginUser(email: String, password: String) -> Bool {

        let request: NSFetchRequest<User> = User.fetchRequest()
        request.predicate = NSPredicate(
            format: "email == %@ AND password == %@",
            email,
            password
        )

        let users = try? context.fetch(request)
        return !(users?.isEmpty ?? true)
    }
}
