//
//  LoginViewModel.swift
//  LegalQuery
//
//  Created by Deepam Sharma on 3/9/26.
//

import SwiftUI
import CoreData

@Observable
class LoginViewModel {

    var email = ""
    var password = ""
    
    var showError = false
    var errorMessage = ""

    private let facade: UserFacade

    init(context: NSManagedObjectContext) {
        self.facade = UserFacade(context: context)
    }

    func loginUser() -> Bool {

        guard !email.isEmpty, !password.isEmpty else {
            showError = true
            errorMessage = "Email and Password required"
            return false
        }

        let success = facade.loginUser(email: email, password: password)

        if !success {
            showError = true
            errorMessage = "Invalid credentials"
        }

        return success
    }
}
