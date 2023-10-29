//
//  SquareBreathing.swift
//  Tranquilitea
//
//  Created by mac on 9/15/23.
//

import SwiftUI

struct SquareBreathing: View {
    @State var timeValue: Float = 0.0 // the amount the green is at
    @State var isActive: Bool = false // if the timer is on
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack{
            Color("Green White")
                .ignoresSafeArea(edges: .top)
            Image("lantern")
                .resizable()
                .scaledToFit()
                .frame(height: 230)
                .position(x: 355, y: 15)
            VStack {
                Spacer()
                    .frame(height: 30)
                
                Text("Square Breathing")
                    .foregroundStyle(.white)
                    .padding()
                    .font(.custom("Inter-Regular", size: 30))
                    .background(RoundedRectangle(cornerRadius: 30)
                        .padding()
                        .frame(width: 330, height: 100)
                        .foregroundColor(Color("Light Green")))
                
                Spacer()
                    .frame(height: 30)
                
                SquareTimer(progress: self.$timeValue)
                    .frame(width: 230.0, height: 230.0)
                    .padding()
                    .onAppear() {
                        self.timeValue = 0.0 // beginning green
                    }
                
                Spacer()
                    .frame(height: 65)
                Button {
                    isActive.toggle()
                } label: {
                    Text(isActive ? "Stop" : "Start")
                        .foregroundStyle(.white)
                        .padding()
                        .font(.custom("Inter-Regular", size: 25))
                        .background(RoundedRectangle(cornerRadius: 30)
                            .padding()
                            .frame(width: 150, height: 80)
                            .foregroundColor(Color("Light Green")))
                }
                    
                Button {
                    timeValue = 0.0
                    isActive = false
                } label: {
                    Text("Reset")
                        .foregroundStyle(.white)
                        .padding()
                        .font(.custom("Inter-Regular", size: 25))
                        .background(RoundedRectangle(cornerRadius: 30)
                            .padding()
                            .frame(width: 150, height: 80)
                            .foregroundColor(Color("Light Green")))
                }
                
                Spacer()
                Divider()
                
            }.onReceive(timer, perform: { _ in guard isActive else {return}
                if timeValue < 16.0 {
                    timeValue += 1.0
                } else {
                    timeValue -= 16.0
                    //no toggle for isActive so it keeps cycling
                }
            })
        }
    }
}

struct SquareTimer: View {
    @Binding var progress: Float
    var color: Color = Color("Dark Green")
    
    var body: some View {
        ZStack {
            // back line
            RoundedRectangle(cornerRadius: 30)
                .stroke(lineWidth: 8.0)
                .opacity(0.75)
                .foregroundColor(Color("Light Green"))
            
            // progress line first half
            RoundedRectangle(cornerRadius: 30)
                .trim(from: 0.125, to: 1.125 - CGFloat((16.0 - self.progress ) / 16.0))
                .stroke(style: StrokeStyle(lineWidth: 8.0, lineCap: .round, lineJoin: . round))
                .foregroundColor(color)
                .rotationEffect(.degrees(90))
                .animation(.easeInOut(duration: 0.5), value: progress)
            
            // progress line second half
            RoundedRectangle(cornerRadius: 30)
                .trim(from: 0.125, to: 1.125 - CGFloat((24.0 - self.progress ) / 16.0)) //starting value of 24 so the cg float value doesnt get bigger than 1.125 until self.progress = 9
                .stroke(style: StrokeStyle(lineWidth: 8.0, lineCap: .round, lineJoin: . round))
                .foregroundColor(color)
                .rotationEffect(.degrees(-90)) //starts at top
                .animation(.easeInOut(duration: 0.5), value: progress)
            
            Text(breathingStage(Int(progress)))
                .font(.custom("Inter-Regular", size: 25))
        }
    }
}

func breathingStage(_ progress: Int) -> String {
    switch progress {
    case 0...4:
        return "Breathe"
    case 9...12:
        return "Exhale"
    default:
        return "Hold"
    }
}

struct SquareBreathing_Previews: PreviewProvider {
    static var previews: some View {
        SquareBreathing()
    }
}
