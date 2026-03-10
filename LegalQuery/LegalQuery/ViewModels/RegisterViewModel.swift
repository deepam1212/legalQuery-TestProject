//
//  RegisterViewModel.swift
//  LegalQuery
//
//  Created by Deepam Sharma on 3/9/26.
//
import SwiftUI
import CoreData

@Observable
class RegisterViewModel {

    var name = ""
    var email = ""
    var password = ""
    var confirmPassword = ""

    var showError = false
    var errorMessage = ""

    private let facade: UserFacade

    init(context: NSManagedObjectContext) {
        self.facade = UserFacade(context: context)
    }

    func registerUser() {

        guard !name.isEmpty,
              !email.isEmpty,
              !password.isEmpty,
              !confirmPassword.isEmpty else {
            showError = true
            errorMessage = "All fields are required"
            return
        }

        guard password == confirmPassword else {
            showError = true
            errorMessage = "Passwords do not match"
            return
        }

        facade.createUser(name: name, email: email, password: password)

        name = ""
        email = ""
        password = ""
        confirmPassword = ""
    }
}
