//
//  MeditationTimer.swift
//  Tranquilitea
//
//  Created by mac on 9/11/23.
//

import SwiftUI

struct IndependentMeditation: View {
    
    @State var timeValue: Float = 0.0// the amount the green is at
    @State var totalTime: Float = 1.0
    @State var isActive: Bool = false
    @State var minutes: Int = 3
    @State var seconds: Int = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack{
            Color("Green White")
                .ignoresSafeArea(edges: .top)
            Image("lantern")
                .resizable()
                .scaledToFit()
                .frame(height: 230)
                .position(x: 345, y: 15)
            VStack {
                ProgressBar(progress: self.$timeValue, isActive: self.$isActive, minutes: self.$minutes, seconds: self.$seconds, totalTime: self.$totalTime)
                    .frame(width: 240, height: 240)
                    .padding(20.0).onAppear() {
                        self.timeValue = 0.0 // beginning green
                    }

                Button {
                    if timeValue == 0.0 {
                        totalTime = Float(minutes*60 + seconds)
                        timeValue = totalTime
                    }
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
                
                Spacer()
                    .frame(height: 30)
                Text("Reminders:")
                    .foregroundStyle(Color("Dark Green"))
                    .font(.custom("Inter-Regular", size: 25))
                    .padding(3)
                Text("""
                1.\tFind a quiet place to sit
                2.\tFocus on your breathing 
                \tinstead of your worries
                3.\tTell yourself positive things in
                \tyour head
                4.\tLet other thoughts simply pass
                5.\tAlways give yourself some time 
                \tto relax
                """)
                    .font(.custom("Inter-Regular", size: 20))
                    .padding(.horizontal, 30)
                 
                Spacer()
                Divider()
                
            }.onReceive(timer, perform: { _ in guard isActive else {return}
                if timeValue > 0.0 {
                    timeValue -= 1.0
                    minutes = Int(timeValue) / 60
                    seconds = Int(timeValue) - minutes*60
                } else {
                    timeValue = 0.0
                    isActive.toggle()
                }
            })
        }
    }
}

struct ProgressBar: View {
    
    @Binding var progress: Float
    @Binding var isActive: Bool
    @Binding var minutes: Int
    @Binding var seconds: Int
    @Binding var totalTime: Float
    
    var body: some View {
        ZStack {
            // back line
            Circle()
                .stroke(lineWidth: 10.0)
                .opacity(0.75)
                .foregroundColor(Color("Light Green"))
            
            // progress line
            Circle()
                .trim(from: 0.0, to: 1 - CGFloat((self.totalTime - self.progress ) / self.totalTime))
                .stroke(style: StrokeStyle(lineWidth: 6.0, lineCap: .round, lineJoin: . round))
                .foregroundColor(Color("Dark Green"))
                .rotationEffect(Angle(degrees: 270)) //starts at top
                .animation(.easeInOut(duration: 1.0), value: progress)
            
            if progress > 0.0 {
                Text("\(minutes):\(seconds < 10 ? String("0\(seconds)") : String(seconds))")
                    .font(.custom("Inter-Regular", size: 25))
            } else {
                HStack(spacing: 0) {
                    Picker("Minutes", selection: $minutes) {
                        ForEach(0...10, id: \.self) { num in
                            Text("\(num)")
                                .font(.custom("Inter-Regular", size: 17))
                        }
                    }
                    .pickerStyle(.wheel)
                    
                    Text("min")
                        .font(.custom("Inter-Bold", size: 17))
                    
                    Picker("Seconds", selection: $seconds) {
                        ForEach(0...59, id: \.self) { num in
                            Text("\(num)")
                                .font(.custom("Inter-Regular", size: 17))
                        }
                    }
                    .pickerStyle(.wheel)
                    
                    Text("sec")
                        .font(.custom("Inter-Bold", size: 17))
                }
                .padding()
                .frame(width: 220, height: 170)
            }
        }
    }
}


struct IndependentMeditation_Previews: PreviewProvider {
    static var previews: some View {
        IndependentMeditation()
    }
}
