//
//  ContentView.swift
//  Navigation
//
//  Created by Evangelos Pipis on 21/12/2023.
//

import SwiftUI

// If you're using NavigationPath to store the active path of your NavigationStack, SwiftUI provides two helpers to make saving and loading your paths easier.
@Observable
class PathStore {
    var path: NavigationPath {
        didSet {
            save()
        }
    }

    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")

    init() {
        // Try and load the saved path.
        if let data = try? Data(contentsOf: savePath) {
            // We want to decode using a particular type; A Codable Representation of our NavigationPath.
            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
                // We can use this object to create a NavigationPath.
                path = NavigationPath(decoded)
                return
            }
        }

        // Still here? Start with an empty NavigationPath.
        path = NavigationPath()
    }

    func save() {
        // NavigationPath can contain non-codable objects. It only needs to comform to Hashable. This check attempts to retrieve the codable NavigationPath out of our data.
        // This returns nil if at least one object in the path doesn't comform to codable.
        guard let representation = path.codable else { return }

        do {
            let data = try JSONEncoder().encode(representation)
            try data.write(to: savePath)
        } catch {
            print("Failed to save navigation data")
        }
    }
}

// If you're using a homogenous array – e.g. [Int] or [String] – then you don't need those helpers, and you can load or save your data freely.
@Observable
class SimplePathStore {
    var path: [Int] {
        didSet {
            save()
        }
    }
    
    private let simpleSavePath = URL.documentsDirectory.appending(path: "SimpleSavePath")
    
    init() {
        // Try and load the saved path.
        if let data = try? Data(contentsOf: simpleSavePath) {
            if let decoded = try? JSONDecoder().decode([Int].self, from: data) {
                path = decoded
                return
            }
        }
        
        // Still here? Start with an empty array.
        path = []
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(path)
            try data.write(to: simpleSavePath)
        } catch {
            print("Failed to save Navigation Data")
        }
    }
}


// DetailView shows its current number as its title, and has a button that pushes to a new random number whenever it's pressed.
// Toolbar button to return to the beginning of the Navigation after having gone through multiple views.
struct DetailView: View {
    var number: Int
    var simplePathStore: SimplePathStore

    var body: some View {
        NavigationLink("Go to Random Number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
            .toolbar {
                Button("Home") {
                    simplePathStore.path = []
                }
            }
    }
}


struct ContentView: View {
    @State private var simplePathStore = SimplePathStore()

    var body: some View {
        // Bind the path of your NavigationStack to the path property of a PathStore instance.
        NavigationStack(path: $simplePathStore.path) {
            DetailView(number: 0, simplePathStore: simplePathStore)
                .navigationDestination(for: Int.self) { i in
                    DetailView(number: i, simplePathStore: simplePathStore)
                }
        }
    }
}

#Preview {
    ContentView()
}
