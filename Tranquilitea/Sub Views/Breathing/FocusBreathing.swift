//
//  FocusBreathing.swift
//  Tranquilitea
//
//  Created by mac on 10/2/23.
//

import SwiftUI

struct FocusBreathing: View {
    
    @State var timeValue: Int = 600 // starting time
    @State var isActive: Bool = false // if the timer is on
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack{
            Color("Green White")
                .ignoresSafeArea(edges: .top)
            VStack {
                Spacer()
                Image("table")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
            }
            VStack {
                Spacer()
                    .frame(height: 10)
                
                Text("Focus Breathing")
                    .foregroundStyle(.white)
                    .padding()
                    .font(.custom("Inter-Regular", size: 30))
                    .background(RoundedRectangle(cornerRadius: 30)
                        .padding()
                        .frame(width: 330, height: 100)
                        .foregroundColor(Color("Light Green")))
                
                Text("""
                     1.\tClose your eyes if they're open.
                     2.\tTake a few big, deep breaths.
                     3.\tBreathe in. As you do that, imagine 
                    \tthat the air is filled with a sense of
                    \tpeace and calm. Try to feel it
                    \tthroughout your body.
                     4.\tBreathe out. While you're doing it,
                    \timagine that the air leaves with your
                    \tstress and tension.
                     5.\tAs you breathe in, say in your mind,
                    \t"I breathe in peace and calm."
                     6.\tAs you breathe out, say in yourmind,
                    \t"I breathe out stress and tension."
                    """)
                    .font(.custom("Inter-Regular", size: 19))
                    .padding()
                
                Spacer()
                    .frame(height: 20)
                
                if isActive {
                    Text(secondToMinute(timeValue))
                        .foregroundStyle(.white)
                        .padding()
                        .font(.custom("Inter-Regular", size: 25))
                        .background(RoundedRectangle(cornerRadius: 30)
                            .padding()
                            .frame(width: 150, height: 80)
                            .foregroundColor(Color("Light Green")))
                } else {
                    Button {
                        isActive.toggle()
                    } label: {
                        Text("Start")
                            .foregroundStyle(.white)
                            .padding()
                            .font(.custom("Inter-Regular", size: 25))
                            .background(RoundedRectangle(cornerRadius: 30)
                                .padding()
                                .frame(width: 150, height: 80)
                                .foregroundColor(Color("Light Green")))
                    }
                }
                
                Spacer()
                Divider()
                
            }.onReceive(timer, perform: { _ in guard isActive else {return}
                if timeValue > 0 {
                    timeValue -= 1
                } else {
                    timeValue = 600
                    isActive.toggle()
                }
            })
        }
    }
}

func secondToMinute(_ time: Int) -> String {
    let minute = time / 60
    let second = time - minute * 60
    
    if (second < 10) {
        return "\(minute):0\(second)"
    }
    return "\(minute):\(second)"
}

#Preview {
    FocusBreathing()
}
