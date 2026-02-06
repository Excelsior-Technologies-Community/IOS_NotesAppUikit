//
//  DataManager.swift
//  NotesAppUikit
//
//  Created by Noman belim on 06/02/26.
//

import Foundation


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
