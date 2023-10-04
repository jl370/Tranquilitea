//
//  MeditationHome.swift
//  Tranquilitea
//
//  Created by mac on 9/11/23.
//

import SwiftUI

struct MeditationHome: View {
    @State var timeValue: Float = 0.0 // the amount the green is at
    @State var isActive: Bool = false // if the timer is on
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            SquareBreathing(progress: self.$timeValue) //  add color: for color
                .frame(width: 160.0, height: 160.0)
                .padding(20.0).onAppear() {
                    self.timeValue = 0.0 // beginning green
                }
            
            HStack {
                Button(isActive ? "stop" : "play") {
                    isActive.toggle()
                }
                
                Button("reset") {
                    timeValue = 0.0
                    isActive = false
                }
                
            }
            
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

struct SquareBreathing: View {
    @Binding var progress: Float
    var color: Color = Color.green
    
    var body: some View {
        ZStack {
            // back line
            RoundedRectangle(cornerRadius: 45)
                .stroke(lineWidth: 10.0)
                .opacity(0.20)
                .foregroundColor(Color.gray)
            
            // progress line first half
            RoundedRectangle(cornerRadius: 45)
                .trim(from: 0.125, to: 1.125 - CGFloat((16.0 - self.progress ) / 16.0))
                .stroke(style: StrokeStyle(lineWidth: 6.0, lineCap: .round, lineJoin: . round))
                .foregroundColor(color)
                .rotationEffect(.degrees(90))
                .animation(.easeInOut(duration: 0.5), value: progress)
            
            // progress line second half
            RoundedRectangle(cornerRadius: 45)
                .trim(from: 0.125, to: 1.125 - CGFloat((24.0 - self.progress ) / 16.0)) //starting value of 24 so the cg float value doesnt get bigger than 1.125 until self.progress = 9
                .stroke(style: StrokeStyle(lineWidth: 6.0, lineCap: .round, lineJoin: . round))
                .foregroundColor(color)
                .rotationEffect(.degrees(-90)) //starts at top
                .animation(.easeInOut(duration: 0.5), value: progress)
            
            Text(breathingStage(Int(progress)))
        }
    }
}

func breathingStage(_ progress: Int) -> String {
    switch progress {
    case 0...4:
        return "breathe"
    case 9...12:
        return "exhale"
    default:
        return "hold"
    }
}


struct MeditationHome_Previews: PreviewProvider {
    static var previews: some View {
        MeditationHome()
    }
}
