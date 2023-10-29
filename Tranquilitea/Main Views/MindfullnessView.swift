//
//  MindfullnessView.swift
//  Tranquilitea
//
//  Created by mac on 9/6/23.
//

import SwiftUI
import CoreData

struct MindfullnessView: View {
    var body: some View {
        NavigationStack {
            ZStack{
                Color("Green White")
                    .ignoresSafeArea(edges: .top)
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
                        .frame(height: 50)
                    
                    Text("Meditation")
                        .foregroundStyle(.black)
                        .padding()
                        .font(.custom("Inter-Regular", size: 30))
                        .background(RoundedRectangle(cornerRadius: 30)
                            .stroke(lineWidth: 5.0)
                            .padding()
                            .frame(width: 310, height: 90)
                            .foregroundColor(Color("Dark Green")))
                    
                    HStack {
                        NavigationLink(destination: GuidedMeditation()){
                            Text("Guided Meditation")
                                .foregroundStyle(.white)
                                .padding()
                                .frame(width: 170)
                                .multilineTextAlignment(.center)
                                .font(.custom("Inter-Regular", size: 23))
                                .background(RoundedRectangle(cornerRadius: 30)
                                    .frame(width: 160, height: 160)
                                    .padding()
                                    .foregroundColor(Color("Light Green")))
                        }
                        
                        NavigationLink(destination: IndependentMeditation()){
                            Text("Independent Meditation")
                                .foregroundStyle(.white)
                                .padding()
                                .frame(width: 170)
                                .multilineTextAlignment(.center)
                                .font(.custom("Inter-Regular", size: 23))
                                .background(RoundedRectangle(cornerRadius: 30)
                                    .frame(width: 160, height: 160)
                                    .padding()
                                    .foregroundColor(Color("Light Green")))
                        }
                    }
                    .padding(.vertical, 50)
                    
                    Spacer()
                        .frame(height: 40)
                    
                    Text("Breathe")
                        .foregroundStyle(.black)
                        .padding()
                        .font(.custom("Inter-Regular", size: 30))
                        .background(RoundedRectangle(cornerRadius: 30)
                            .stroke(lineWidth: 5.0)
                            .padding()
                            .frame(width: 310, height: 90)
                            .foregroundColor(Color("Dark Green")))
                    
                    HStack {
                        NavigationLink(destination: SquareBreathing()){
                            Text("Box Breathing")
                                .foregroundStyle(.white)
                                .padding()
                                .frame(width: 170)
                                .multilineTextAlignment(.center)
                                .font(.custom("Inter-Regular", size: 23))
                                .background(RoundedRectangle(cornerRadius: 30)
                                    .frame(width: 160, height: 160)
                                    .padding()
                                    .foregroundColor(Color("Light Green")))
                        }
                        
                        NavigationLink(destination: FocusBreathing()){  
                            Text("Focus Breathing")
                                .foregroundStyle(.white)
                                .padding()
                                .frame(width: 170)
                                .multilineTextAlignment(.center)
                                .font(.custom("Inter-Regular", size: 23))
                                .background(RoundedRectangle(cornerRadius: 30)
                                    .frame(width: 160, height: 160)
                                    .padding()
                                    .foregroundColor(Color("Light Green")))
                        }
                    }
                    .padding(.vertical, 50)
                    
                    Spacer()
                    Divider()
                }
            }
        }
    }
}
    
struct MindfullnessView_Previews: PreviewProvider {
    static var previews: some View {
        MindfullnessView()
    }
}
