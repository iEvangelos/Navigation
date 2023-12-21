//
//  ContentView.swift
//  Navigation
//
//  Created by Evangelos Pipis on 21/12/2023.
//

import SwiftUI

//Most of Swift's built-in types already conform to Hashable.
//If you make a custom struct with properties that all conform to Hashable, you can make the whole struct conform to Hashable with one tiny change.
struct Student: Hashable {
    var id = UUID()
    var name: String
    var age: Int
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(0..<100) { i in
                //Now we're using NavigationLink with a NavigationDestination
                NavigationLink("Select \(i)", value: i)
            }
            //The navigationDestination() modifier tell it "when you're asked to navigate to an integer, here's what you should do…"
            .navigationDestination(for: Int.self) { selection in
                Text("You selected \(selection)")
            }
            //This navigationDestination() modifier is similar but for a Student object.
            .navigationDestination(for: Student.self) { student in
                Text("You selected \(student.name)")
            }
        }
    }
}

#Preview {
    ContentView()
}
