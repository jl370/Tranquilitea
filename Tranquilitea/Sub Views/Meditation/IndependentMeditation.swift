//
//  MeditationTimer.swift
//  Tranquilitea
//
//  Created by mac on 9/11/23.
//

import SwiftUI

struct IndependentMeditation: View {
    @State var timeValue: Float = 0.0 // the amount the green is at
    @State var isActive: Bool = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            ProgressBar(progress: self.$timeValue) //  add color: for color
                .frame(width: 160.0, height: 160.0)
                .padding(20.0).onAppear() {
                    self.timeValue = 0.0 // beginning green
                }
            
            HStack {
                Button(isActive ? "stop" : "play") {
                    isActive.toggle()
                    /*if (timeValue < 10.0) {
                        timeValue += 1.0
                    } else {
                        timeValue -= 10.0
                    }*/
                }
                
                Button("reset") {
                    timeValue = 0.0
                    isActive = false
                }
                
            }
            // find a way to add time to this
            
        }.onReceive(timer, perform: { _ in guard isActive else {return}
            if timeValue < 10.0 {
                timeValue += 1.0
            } else {
                timeValue -= 10.0
                isActive.toggle()
            }
        })
        
    }
}

struct ProgressBar: View {
    @Binding var progress: Float
    var color: Color = Color.green
    
    var body: some View {
        ZStack {
            // back line
            Circle()
                .stroke(lineWidth: 10.0)
                .opacity(0.20)
                .foregroundColor(Color.gray)
            
            // progress line
            Circle()
                .trim(from: 0.0, to: 1 - CGFloat((10.0 - self.progress ) / 10.0))
                .stroke(style: StrokeStyle(lineWidth: 6.0, lineCap: .round, lineJoin: . round))
                .foregroundColor(color)
                .rotationEffect(Angle(degrees: 270)) //starts at top
                .animation(.easeInOut(duration: 1.0), value: progress)
            
            Text(String(Int(progress)))
        }
    }
}

struct IndependentMeditation_Previews: PreviewProvider {
    static var previews: some View {
        IndependentMeditation()
    }
}
