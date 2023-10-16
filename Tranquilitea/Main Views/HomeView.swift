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
                Color("Green White")
                    .ignoresSafeArea(edges: .top)
                VStack {
                    Spacer()
                    Text("Hello, World!")
                        .font(.custom("Inter-Regular", size: 17))
                    Text("Hello, World!")
                        .padding()
                        .font(.custom("Inter-Regular", size: 16.5))
                    Text("Hello, World!")
                    Text("hij")
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
