//
//  ContentView.swift
//  Tranquilitea
//
//  Created by mac on 9/4/23.
//

import SwiftUI


struct ContentView: View {
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            MindfullnessView()
                .tabItem {
                    Label("Mindfullness", systemImage: "figure.mind.and.body")
                }
            
            ReflectionView()
                .tabItem {
                    Label("Reflection", systemImage: "pencil")
                }
        }
        
    }    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
