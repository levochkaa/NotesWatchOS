// DetailNoteView.swift

import SwiftUI

struct DetailNoteView: View {
    
    @State var text = ""

    @Environment(\.dismiss) var dismiss

    var body: some View {
        ScrollView {
            Text(text)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
    }
}
