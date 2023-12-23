//
//  ContentView.swift
//  Navigation
//
//  Created by Evangelos Pipis on 21/12/2023.
//

import SwiftUI

struct ContentView: View {
    // Create @State to hold the value of the NavigationTitle.
    @State private var title = "SwiftUI"

    var body: some View {
        NavigationStack {
            Text("Hello, world!")
                .navigationTitle($title)
            // If you're using the .inline title display mode, you can also pass a binding to navigationTitle(). This will then be displayed as usual, but with an important addition: iOS will show a small arrow next to your title, that reveals a "Rename" button to change the title.
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
