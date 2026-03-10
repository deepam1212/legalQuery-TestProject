# Legal Query App (SwiftUI + CoreData)

A simple iOS application built using **SwiftUI**, **CoreData**, and **MVVM architecture** that allows users to register, log in, create legal queries, and browse public queries. The project demonstrates clean architecture practices such as **Repository Pattern** and **Facade Pattern** to keep the code modular, testable, and scalable.

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
