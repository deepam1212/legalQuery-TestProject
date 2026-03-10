//
//  LegalQueryApp.swift
//  LegalQuery
//
//  Created by Deepam Sharma on 3/9/26.
//

import SwiftUI
import CoreData

@main
struct LegalQueryApp: App {
    
    let persistenceController = PersistenceController.shared
    @State private var authViewModel = AuthViewModel()

    var body: some Scene {
        WindowGroup {

            if authViewModel.isLoggedIn {
                QueryListView(
                    context: persistenceController.container.viewContext
                )
            } else {
                LoginView(
                    context: persistenceController.container.viewContext
                )
            }
        }
        .environment(authViewModel)
        .environment(
            \.managedObjectContext,
            persistenceController.container.viewContext
        )
    }
}
