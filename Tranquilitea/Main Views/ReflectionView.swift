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
