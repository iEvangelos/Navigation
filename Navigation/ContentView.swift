//
//  ContentView.swift
//  Navigation
//
//  Created by Evangelos Pipis on 21/12/2023.
//

import SwiftUI

struct ContentView: View {
    // NavigationPath is able to hold a variety of data types in a single path. In practice it works very similarly to an array.
    // NavigationPath is what we call a type-eraser – it stores any kind of Hashable data without exposing exactly what type of data each item is.
    @State private var path = NavigationPath()
    
    var body: some View {
        // Bind to the NavigationPath we crated.
        NavigationStack(path: $path) {
            List {
                ForEach(0..<5) { i in
                    // Pass in the values as an Int.
                    NavigationLink("Select Number: \(i)", value: i)
                }

                ForEach(0..<5) { i in
                    // Pass in the value as a String.
                    NavigationLink("Select String: \(i)", value: String(i))
                }
            }
            .toolbar {
                Button("Push 556") {
                    // Using the NavigationPath we can push in values as an Int.
                    path.append(556)
                }

                Button("Push Hello") {
                    // // Using the NavigationPath we can push in values as a String.
                    path.append("Hello")
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected the number \(selection)")
            }
            .navigationDestination(for: String.self) { selection in
                Text("You selected the string \(selection)")
            }
        }
    }
}

#Preview {
    ContentView()
}
