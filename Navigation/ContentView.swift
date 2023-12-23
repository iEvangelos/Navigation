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
            Text("Hello World")
                .toolbar {
                    // If you want multiple buttons using the same placement, you can either repeat ToolbarItem...
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Leading 1") {
                            // Button action here.
                        }
                    }
                    
                    /* Although you can force a button placement, usually it's better to use one of the semantic options – placement that have specific meaning, rather than relying just on their location. These include:
                     
                     .confirmationAction, when you want users to agree to something, such as agreeing to terms of service.
                     .destructiveAction, when the user needs to make a choice to destroy whatever it is they are working with, such as confirming they want to remove some data they created.
                     .cancellationAction, when the user needs to back out of changes they have made, such as discarding changes they have made.
                     .navigation, which is used for buttons that make the user move between data, such as going back and forward in a web browser.*/
                    ToolbarItem(placement: .topBarLeading) {
                        Button("Leading 1") {
                            // Button action here.
                        }
                    }
                    
                    //...or you can use ToolbarItemGroup, like this:
                    ToolbarItemGroup(placement: .topBarTrailing) {
                        Button("Trailing 1") {
                            // Button action here.
                        }
                        
                        Button("Trailing 2") {
                            // Button action here.
                        }
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
