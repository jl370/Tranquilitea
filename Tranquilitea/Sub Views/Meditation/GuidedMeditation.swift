//
//  GuidedMeditation.swift
//  Tranquilitea
//
//  Created by mac on 9/11/23.
//

import SwiftUI
import AVKit

struct GuidedMeditation: View {
    
    @State var audioPlayer: AVAudioPlayer!
    @State var isActive: Bool = false
    //@State var angle: CGFloat = 0.0
    
    var body: some View {
        ZStack{
            Color("Green White")
                .ignoresSafeArea(edges: .top)
            Image("plant")
                .resizable()
                .scaledToFit()
                .frame(height: 230)
                .position(x: 53, y: 552)
            Image("plant")
                .resizable()
                .scaledToFit()
                .frame(height: 230)
                .position(x: 343, y: 552)
            Ellipse()
                .foregroundStyle(Color("Light Green"))
                .frame(width: 531, height: 422)
                .position(x: 196.5, y: 5)
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(height: 90)
                .position(x: 196.5, y: 65)
            Color("Dark Green")
                .frame(width: 120, height: 4)
                .position(x: 196.5, y: 125)
            
            /*Circle()
                .trim(from: 0, to: 0.2)
                .stroke(Color.black.opacity(0.06), lineWidth: 4)
                .frame(width: 300, height: 300)
                .rotationEffect(.degrees(-126))
            Circle()
                .trim(from: 0, to: CGFloat(angle) / 360)
                .stroke(Color.blue, lineWidth: 4)
                .frame(width: 300, height: 300)
                .rotationEffect(.degrees(-126))
            Circle()
                .foregroundStyle(Color.blue)
                .frame(width: 25, height: 25)
                .offset(x: 150)
                .rotationEffect(.degrees(-126))
                .gesture(DragGesture().onChanged(onChanged())*/
            
            Button {
                if isActive {
                    self.audioPlayer.pause()
                } else {
                    self.audioPlayer.play()
                }
                isActive.toggle()
            } label: {
                Image(systemName: isActive ? "pause.circle.fill" : "triangle.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .rotationEffect(.degrees(isActive ? 0 : 90))
                    .foregroundStyle(Color("Dark Green"), Color("Light Green"))
                    .frame(width: 70)
            }
            .offset(y: 20)
        }
        .onAppear {
            let sound = Bundle.main.path(forResource: "guidedMeditation1", ofType: "mp3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
    }
}


struct GuidedMeditation_Previews: PreviewProvider {
    static var previews: some View {
        GuidedMeditation()
    }
}
