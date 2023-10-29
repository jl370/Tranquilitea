//
//  AffirmationView.swift
//  Tranquilitea
//
//  Created by mac on 10/2/23.
//

import SwiftUI

struct AffirmationView: View {
    
    @State var text = "im cool"
    @State var quote = "deep quote here"
    
    var body: some View {
        ZStack {
            Color("Green White").ignoresSafeArea(edges: .top)
            Image("crane")
                .resizable()
                .scaledToFit()
                .frame(height: 150)
                .position(x: 265, y: 570)
            VStack {
                
                Text("Say this 5 times")
                    .padding(.top, 10)
                    .font(.custom("Inter-Regular", size: 20))
                Color("Light Green")
                    .frame(width: 180, height: 4)
                    .padding(.bottom)
                
                ScrollView {
                    VStack {
                        Text(text)
                            .foregroundStyle(.black)
                            .multilineTextAlignment(.leading)
                            .font(.custom("Inter-Regular", size: 17))
                            .frame(width: 300)
                            .frame(minHeight: 250)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 25)
                                .stroke(lineWidth: 5.0)
                                .foregroundStyle(Color("Dark Green"))
                                .background(RoundedRectangle(cornerRadius: 25)
                                    .foregroundStyle(Color("Green White"))))
                        
                        Spacer()
                            .frame(height: 50)
                        Text(quote)
                            .padding([.leading, .bottom, .trailing])
                            .font(.custom("Inter-Regular", size: 21))
                        Spacer()
                            .frame(height: 50)
                    }
                    .padding()
                }
                Spacer()
                Divider()
            }
        }
    }
}

#Preview {
    AffirmationView()
}
