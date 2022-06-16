// Note.swift

import Foundation

struct Note: Identifiable, Codable, Equatable {
    var id: UUID
    var text: String

    static func == (lhs: Note, rhs: Note) -> Bool {
        return lhs.id == rhs.id
    }

    static let example = Note(id: UUID(), text: "Just a simple example")
}
