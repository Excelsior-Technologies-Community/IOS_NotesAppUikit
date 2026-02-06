# NotesAppUIKit

A clean and intuitive iOS notes application built with UIKit, demonstrating CRUD operations and local data persistence.

## 📱 Overview

NotesAppUIKit is a lightweight note-taking application that allows users to create, view, and manage notes with persistent local storage. Built as a learning project to demonstrate fundamental iOS development concepts using UIKit.

## ✨ Features

- **Create Notes** - Add new notes with title and content
- **View Notes** - Browse all saved notes in an organized list
- **Delete Notes** - Remove notes with swipe-to-delete gesture
- **Data Persistence** - Notes are saved locally and persist across app launches
- **Input Validation** - Ensures data integrity with user-friendly alerts
- **Clean Navigation** - Intuitive navigation flow between screens

## 🛠 Tech Stack

| Technology | Purpose |
|-----------|---------|
| Swift | Primary programming language |
| UIKit | UI framework |
| Storyboard | Interface design |
| UITableView | List rendering |
| UserDefaults | Local data storage |
| NavigationController | Screen navigation management |

## 📂 Project Structure

```
NotesAppUIKit/
├── AddNotes.swift           # Add/Create note screen
├── ViewController.swift     # Main dashboard with notes list
├── DataManager.swift        # Data persistence layer
├── Note.swift              # Note data model
├── AppDelegate.swift
├── SceneDelegate.swift
└── Main.storyboard         # UI layouts
```

## 🎯 Key Implementation Details

### Data Storage

Notes are stored using `UserDefaults` as an array of dictionaries:

```swift
class DataManager {
    static let shared = DataManager()
    private let key = "notes_data"
    
    func saveNotes(_ notes: [[String: String]]) {
        UserDefaults.standard.set(notes, forKey: key)
    }
    
    func loadNotes() -> [[String: String]] {
        return UserDefaults.standard.array(forKey: key) as? [[String: String]] ?? []
    }
}
```

### CRUD Operations

| Operation | Implementation |
|-----------|---------------|
| **Create** | `saveTapped()` in AddNotes |
| **Read** | `loadNotes()` + UITableView |
| **Update** | Planned feature |
| **Delete** | Swipe-to-delete gesture |

### Input Validation

```swift
func saveTapped() {
    let title = titleTextField.text ?? ""
    let content = contentTextView.text ?? ""
    
    guard !title.isEmpty, !content.isEmpty else {
        showAlert()
        return
    }
    
    // Save logic...
}
```

