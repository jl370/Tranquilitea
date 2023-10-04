//
//  AffirmationSelection.swift
//  Tranquilitea
//
//  Created by mac on 10/2/23.
//

import SwiftUI

struct AffirmationSelection: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color("Green White").ignoresSafeArea(edges: .top)
                VStack {
                    Spacer()
                    Text("Affirmation of the day:")
                        .font(.custom("Inter-Regular", size: 20.0))
                        .padding(.top)
                    
                    NavigationLink(destination: AffirmationView()) { RoundedRectangle(cornerRadius: 30)
                            .stroke(lineWidth: 5.0)
                            .padding([.leading, .bottom, .trailing])
                            .frame(width: 350, height: 210)
                            .foregroundColor(Color("Dark Green"))
                    }
                    
                    Text("or")
                        .font(.custom("Inter-Regular", size: 20.0))
                        .padding()
                    Text("What affirmation do you need today?")
                        .font(.custom("Inter-Regular", size: 20.0))
                    
                    ScrollView() {
                        ForEach(1...10, id: \.self) { title in
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(lineWidth: 5.0)
                                .padding([.leading, .bottom, .trailing])
                                .frame(width: 350, height: 80)
                                .foregroundColor(Color("Dark Green"))
                        }
                        .padding()
                    }
                    
                    Spacer()
                    Divider()
                }
            }
        }
    }
}

#Preview {
    AffirmationSelection()
}
