// ContentView.swift

import SwiftUI

struct ContentView: View {

    @State private var text = ""

    @StateObject private var viewModel = ViewModel()

    var body: some View {
        List {
            ForEach(viewModel.notes) { note in
                NavigationLink(destination: DetailNoteView(text: note.text)) {
                    Text(note.text)
                        .font(.headline)
                        .lineLimit(1)
                }
            }
            .onDelete { offsets in
                viewModel.deleteNote(atOffsets: offsets)
            }
        }
        .navigationTitle("Notes")
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                HStack(alignment: .center, spacing: 6) {
                    TextField("Add Note", text: $text)
                    Button {
                        guard !text.isEmpty else { return }
                        withAnimation {
                            viewModel.addNote(text: text)
                            text = ""
                        }
                    } label: {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 30))
                    }
                    .buttonStyle(.plain)
                }
                .padding(.bottom, 5)
            }
        }
        //        ScrollView {
        //            VStack {
        //                HStack(alignment: .center, spacing: 6) {
        //                    TextField("Add Note", text: $text)
        //                    Button {
        //                        guard !text.isEmpty else { return }
        //                        withAnimation {
        //                            viewModel.addNote(text: text)
        //                            text = ""
        //                        }
        //                    } label: {
        //                        Image(systemName: "plus.circle")
        //                            .font(.system(size: 30))
        //                    }
        //                    .buttonStyle(.plain)
        //                }
        //            }
        //        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
