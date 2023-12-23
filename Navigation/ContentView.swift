//
//  ContentView.swift
//  Navigation
//
//  Created by Evangelos Pipis on 21/12/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(0..<100) { i in
                Text("Row \(i)")
            }
            .navigationTitle("Title goes here")
            .navigationBarTitleDisplayMode(.inline)
            // Tip: Later on you'll meet other kinds of toolbars. These modifiers affect all bars, but if you want to just modify the navigation bar you should add for: .navigationBar as a second parameter to both of them.
            .toolbarBackground(.blue, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            // Hiding the toolbar won't stop you from navigating to new views, but it might cause scrolling views to go under system information such as the clock – be careful!
            .toolbar(.hidden, for: .navigationBar)
        }
    }
}

#Preview {
    ContentView()
}
