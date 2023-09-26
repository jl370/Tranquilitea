//
//  HomeView.swift
//  Tranquilitea
//
//  Created by mac on 9/9/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ZStack{
                Color.cyan.ignoresSafeArea(edges: .top)
                VStack {
                    Spacer()
                    Text("test")
                        .padding()
                    Text("Hello, World!")
                    Spacer()
                    Divider()
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
