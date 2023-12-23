//
//  ContentView.swift
//  Navigation
//
//  Created by Evangelos Pipis on 21/12/2023.
//

import SwiftUI

// DetailView shows its current number as its title, and has a button that pushes to a new random number whenever it's pressed.
// Toolbar button to return to the beginning of the Navigation after having gone through multiple views.
struct DetailView: View {
    var number: Int
    
    /* To set the NavigationPath to a new value from the subview, when you don't have access to the original path property you have two options: either store your path in an external class that uses @Observable, or bring in a new property wrapper called @Binding.
     The @Binding property wrapper lets us pass an @State property into another view and modify it from there – we can share an @State property in several places, and changing it in one place will change it everywhere. */
    @Binding var path: NavigationPath
    
    var body: some View {
        NavigationLink("Go to random number", value: Int.random(in: 0...500))
            .navigationTitle("Number: \(number)")
            .toolbar {
                Button("Home") {
                    path = NavigationPath()
                }
            }
    }
}

struct ContentView: View {
    // NavigationPath is able to hold a variety of data types in a single path. In practice it works very similarly to an array.
    // NavigationPath is what we call a type-eraser – it stores any kind of Hashable data without exposing exactly what type of data each item is.
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            // We can present the DetailView from our ContentView, starting with an initial value of 0 but navigating to a new DetailView every time a new integer is shown.
            DetailView(number: 0, path: $path)
                .navigationDestination(for: Int.self) { i in
                    DetailView(number: i, path: $path)
                }
        }
    }
}

#Preview {
    ContentView()
}
