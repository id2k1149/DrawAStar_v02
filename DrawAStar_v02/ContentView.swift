//
//  ContentView.swift
//  DrawAStar_v02
//
//  Created by Max Franz Immelmann on 5/15/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            LessonView()
                .tabItem {
                    Label("5 Points Star",
                          systemImage: "star")
                }
            
            ListView()
                .tabItem {
                    Label("Star List",
                          systemImage: "list.bullet")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
