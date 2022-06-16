// ViewModel+ContentView.swift

import Foundation

extension ContentView {
    @MainActor class ViewModel: ObservableObject {

        private let decoder = JSONDecoder()
        private let encoder = JSONEncoder()
        private let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedNotes")

        @Published private(set) var notes = [Note]()

        init() {
            loadNotes()
        }

        public func updateNote(note: Note) {
            guard let index = notes.firstIndex(of: note) else { return }
            notes[index] = note
        }

        public func addNote(text: String) {
            let newNote = Note(id: UUID(), text: text)
            notes.append(newNote)
            saveNotes()
        }

        public func deleteNote(atOffsets offsets: IndexSet) {
//            guard let index = notes.firstIndex(of: note) else { return }
            notes.remove(atOffsets: offsets)
            saveNotes()
        }

        private func loadNotes() {
            do {
                let data = try Data(contentsOf: savePath)
                notes = try decoder.decode([Note].self, from: data)
            } catch {
                print(error.localizedDescription)
            }
        }

        private func saveNotes() {
            do {
                let data = try encoder.encode(notes)
                try data.write(to: savePath, options: [.atomic, .completeFileProtection])
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
