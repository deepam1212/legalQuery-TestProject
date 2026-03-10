# Legal Query App (SwiftUI + CoreData)

A simple iOS application built using **SwiftUI**, **CoreData**, and **MVVM architecture** that allows users to register, log in, create legal queries, and browse public queries. The project demonstrates clean architecture practices such as **Repository Pattern** and **Facade Pattern** to keep the code modular, testable, and scalable.

This project was developed as part of a coding assignment to demonstrate good iOS architecture and SwiftUI best practices.

---

## Features

- User Registration
- User Login
- Create Legal Queries
- View Personal Queries
- Browse Public Queries
- Logout functionality
- CoreData persistence
- Clean MVVM architecture

---

## Architecture

The project follows **MVVM (Model–View–ViewModel)** architecture.

### Layers

**View**
- SwiftUI screens
- Handles UI rendering and user interaction

**ViewModel**
- Contains presentation logic
- Communicates with the Facade layer

**Facade Layer**
- Provides a simplified interface for complex operations
- Coordinates repositories and business logic

**Repository Layer**
- Handles data access
- Abstracts CoreData operations

**CoreData Layer**
- Manages persistence and storage

---

## Design Patterns Used

### MVVM
Separates UI from business logic.

### Repository Pattern
Encapsulates CoreData operations and provides a clean interface for data access.

### Facade Pattern
Simplifies interactions between ViewModels and repositories.

---

## Folder Structure

```
LegalQueryApp
│
├── App
│   └── LegalQueryApp.swift
│
├── Models
│   ├── User
│   └── Query
│
├── ViewModels
│   ├── LoginViewModel
│   ├── RegisterViewModel
│   ├── QueryListViewModel
│   └── AuthViewModel
│
├── Views
│   ├── LoginView
│   ├── RegisterView
│   ├── QueryListView
│   ├── CreateQueryView
│   └── BrowsePublicQueriesView
│
├── Repositories
│   ├── UserRepository
│   └── QueryRepository
│
├── Facades
│   ├── UserFacade
│   └── QueryFacade
│
├── Persistence
│   └── PersistenceController
│
└── Components
    └── AppBackgroundView
```

---

## Tech Stack

- Swift
- SwiftUI
- CoreData
- MVVM Architecture
- Repository Pattern
- Facade Pattern

---

## Login Flow

```
Login
   ↓
Query List
   ↓
Create Query / View Queries
   ↓
Logout
   ↓
Back to Login
```

The navigation flow ensures users cannot return to the login screen using the back button after logging in.

---

## Data Persistence

The application uses **CoreData** to store:

- Users
- Queries

Queries can be marked as **Public**, allowing them to appear in the public query browsing screen.

---

## Possible Improvements

Some potential enhancements that could be added:

- Input validation improvements
- Unit tests for ViewModels and Repositories
- SwiftData migration
- Network layer integration
- Pagination for queries
- Search functionality
- Better error handling

---

## How to Run

1. Clone the repository

```
git clone https://github.com/your-username/legal-query-app.git
```

2. Open the project in **Xcode**

3. Build and run on a simulator

---

## Author

Deepam Sharma  
iOS Developer with experience in building scalable mobile applications using Swift and UIKit/SwiftUI.

---

## Notes

This project focuses on demonstrating **clean architecture and maintainable code structure** rather than building a production-level legal service platform.
