//
//  ContentView.swift
//  Navigation
//
//  Created by Evangelos Pipis on 21/12/2023.
//

import SwiftUI

struct ContentView: View {
    //Create an @State property to store an array of integers that will be used for the path of the NavigationStack
    @State private var path = [Int]()

    var body: some View {
        //Bind that property to the path of our NavigationStack, meaning that changing the array will automatically navigate to whatever is in the array, but also changes the array as the user presses Back in the navigation bar.
        NavigationStack(path: $path) {
            VStack {
                //We're setting the whole array so that it just contains the number 32. If anything else happened to be in the array it will be removed, meaning that the NavigationStack will return to its original state before navigating to the number 32.
                Button("Show 32") {
                    path = [32]
                }

                //We're appending 64, meaning that it will be added to whatever we were navigating to. So, if our array already contained 32, we'd now have three views in the stack: the original view (called the "root" view), then something to show the number 32, and finally something to show the number 64.
                Button("Show 64") {
                    path.append(64)
                }
                
                //That will present a view for 32 then a view for 64, so the user needs to tap Back twice to get back to the root view.
                Button("Show 32 then 64") {
                    path = [32, 64]
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected \(selection)")
            }
        }
    }
}

#Preview {
    ContentView()
}
