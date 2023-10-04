//
//  AffirmationView.swift
//  Tranquilitea
//
//  Created by mac on 10/2/23.
//

import SwiftUI

struct AffirmationView: View {
    
    @State var text = "temp"
    
    var body: some View {
        ZStack {
            Color("Green White").ignoresSafeArea(edges: .top)
            VStack {
                
                Text("Say this _ times")
                    .padding(.top, 40.0)
                    .font(.custom("Inter-Regular", size: 20.0))
                Color("Light Green")
                    .frame(width: 180, height: 4)
                    .padding(.bottom)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(lineWidth: 5.0)
                        .padding()
                        .frame(width: 350, height: 370)
                        .foregroundColor(Color("Dark Green"))
                    Text(text)
                        .font(.custom("Inter-Regular", size: 20.0))
                }
                
                Spacer()
                Text("um idk what this is supposed to be pls help me")
                    .padding([.leading, .bottom, .trailing])
                    .font(.custom("Inter-Regular", size: 20.0))
                
                Spacer()
                Divider()
            }
        }
    }
}

#Preview {
    AffirmationView()
}
