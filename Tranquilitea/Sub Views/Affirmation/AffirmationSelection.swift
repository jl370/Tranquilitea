//
//  AffirmationSelection.swift
//  Tranquilitea
//
//  Created by mac on 10/2/23.
//

import SwiftUI

struct AffirmationSelection: View {
    
    //scene storage allows this value to not change everytime i open something else for a while
    @SceneStorage("dailyAffirmation") var dailyAffirmation = affirmations[affrimationTitles.randomElement()!]!.randomElement()!
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color("Green White").ignoresSafeArea(edges: .top)
                VStack {
                    Spacer()
                    HStack {
                        Image("border")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 80)
                        Spacer()
                        Image("border")
                            .resizable()
                            .scaledToFit()
                            .scaleEffect(x: -1, y: 1)
                            .frame(height: 80)
                    }
                }
                VStack {
                    Text("Affirmation of the day:")
                        .font(.custom("Inter-Regular", size: 20.0))
                        .padding(.top)
                    
                    NavigationLink(destination: AffirmationView(
                        text: dailyAffirmation,
                        quote: quotes.randomElement()!)) {
                        Text(dailyAffirmation)
                            .font(.custom("Inter-Regular", size: 17))
                            .frame(width: 300, height: 180)
                            .foregroundStyle(.black)
                            .padding()
                            .multilineTextAlignment(.leading)
                            .background(RoundedRectangle(cornerRadius: 30)
                                .stroke(lineWidth: 5.0)
                                .foregroundColor(Color("Dark Green")))
                    }
                    
                    Spacer()
                        .frame(height: 20)
                    Text("or")
                        .font(.custom("Inter-Regular", size: 20.0))
                        .padding()
                    Text("What affirmation do you need today?")
                        .font(.custom("Inter-Regular", size: 20.0))
                    
                    ScrollView() {
                        ForEach(affrimationTitles, id: \.self) { title in
                            NavigationLink(destination: AffirmationView(
                                text: affirmations[title]!.randomElement()!,
                                quote: quotes.randomElement()!)) {
                                Text("\(title)")
                                    .foregroundStyle(.black)
                                    .multilineTextAlignment(.center)
                                    .frame(width: 300)
                                    .padding()
                                    .font(.custom("Inter-Regular", size: 20))
                                    .background(RoundedRectangle(cornerRadius: 20)
                                        .stroke(lineWidth: 5.0)
                                        .foregroundColor(Color("Dark Green"))
                                        .frame(height: 50)
                                        .padding()
                                        .background(RoundedRectangle(cornerRadius: 20)
                                            .foregroundColor(Color("Green White"))
                                            .frame(height: 50)
                                            .padding()))
                            }
                            Spacer()
                                .frame(height: 20)
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
