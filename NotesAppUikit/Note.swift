//
//  Note.swift
//  NotesAppUikit
//
//  Created by Noman belim on 06/02/26.
//

import Foundation
struct Note: Codable {
    var id: UUID
    var title: String
    var content: String
}
