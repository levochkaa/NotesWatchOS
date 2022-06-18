// DetailNoteView.swift

import SwiftUI

struct DetailNoteView: View {
    
    @State var text = ""

    var body: some View {
        ScrollView {
            Text(text)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
    }
}
