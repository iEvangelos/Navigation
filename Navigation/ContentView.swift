//
//  ContentView.swift
//  Navigation
//
//  Created by Evangelos Pipis on 21/12/2023.
//

import SwiftUI

struct DetailView: View {
    var number: Int

    var body: some View {
        Text("Detail View \(number)")
    }

    //Initiatlise the number, and print a message to console to showcase that the creation of this value happens before we interact with the NavigationLink in the content view.
    init(number: Int) {
        self.number = number
        print("Creating detail view \(number)")
    }
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(0..<1000) { i in
                //Simple NavigationLink.
                //SwiftUI creates a detail view instance just when showing the NavigationLink on screen.
                //When dealing with dynamic data that ends up being a lot of extra work for SwiftUI.
                NavigationLink("Tap Me") {
                    DetailView(number: i)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
