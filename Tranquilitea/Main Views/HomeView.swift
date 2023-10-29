//
//  HomeView.swift
//  Tranquilitea
//
//  Created by mac on 9/9/23.
//

import SwiftUI

struct HomeView: View {
    
    @State var selectedView: viewsList = viewList.randomElement()!
    
    var body: some View {
        NavigationStack {
            ZStack{
                Color("Home")
                    .ignoresSafeArea(edges: .top)
                Image("clouds")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 600)
                    .position(x: 175, y: 150)
                Image("crane")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 180)
                    .position(x: 145, y: 423)
                    .rotationEffect(.degrees(15))
                Image("crane")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 105)
                    .position(x: 295, y: 250)
                VStack {
                    Spacer()
                        .frame(height: 40)
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 80)
                        .offset(x: 5)
                    Text("Hi!")
                        .font(.custom("Inter-Regular", size: 35))
                    Spacer()
                        .frame(height: 340)
                    Text("Recomended activity for the day:")
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .font(.custom("Inter-Regular", size: 25))
                    
                    NavigationLink(destination: selectedView.destination) {
                        Text(selectedView.name)
                            .foregroundStyle(.black)
                            .font(.custom("Inter-Regular", size: 25))
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 25)
                                .stroke(lineWidth: 5.0)
                                .foregroundColor(Color("Dark Green"))
                                .frame(height: 60))
                    }
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
