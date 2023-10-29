//
//  ReflectionView.swift
//  Tranquilitea
//
//  Created by mac on 9/9/23.
//

import SwiftUI

struct ReflectionView: View {
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
                    Spacer()
                        .frame(height: 45)
                    
                    NavigationLink(destination: AffirmationSelection()) {
                        ZStack{
                            RoundedRectangle(cornerRadius: 30)
                                .padding([.top, .leading, .trailing])
                                .foregroundColor(Color("Light Green"))
                                .frame(width: 350, height: 190)
                            VStack{
                                Text("Affirmations")
                                    .padding([.top, .leading, .trailing])
                                    .foregroundColor(.white)
                                    .font(.custom("Inter-Regular", size: 30.0))
                                Image("Affirmations")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 70)
                            }
                        }
                    }
                    
                    NavigationLink(destination: PromptSelection()) {
                        ZStack{
                            RoundedRectangle(cornerRadius: 30)
                                .padding([.top, .leading, .trailing])
                                .foregroundColor(Color("Light Green"))
                                .frame(width: 350, height: 190)
                            VStack{
                                Text("Prompts")
                                    .padding([.top, .leading, .trailing])
                                    .foregroundColor(.white)
                                    .font(.custom("Inter-Regular", size: 30.0))
                                Image("Prompts")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 70)
                            }
                        }
                    }
                    
                    NavigationLink(destination: JournalSelection()) {
                        ZStack{
                            RoundedRectangle(cornerRadius: 30)
                                .padding([.top, .leading, .trailing])
                                .foregroundColor(Color("Light Green"))
                                .frame(width: 350, height: 190)
                            VStack{
                                Text("Journal")
                                    .padding([.top, .leading, .trailing])
                                    .foregroundColor(.white)
                                    .font(.custom("Inter-Regular", size: 30.0))
                                Image("Journal")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(height: 70)
                            }
                        }
                    }
                    
                    Spacer()
                    Divider()
                }
            }
        }
    }
}

struct ReflectionView_Previews: PreviewProvider {
    static var previews: some View {
        ReflectionView()
    }
}
