//
//  ContentView.swift
//  leafAnimation
//
//  Created by rutik maraskolhe on 01/08/21.
//

import SwiftUI

struct ContentView: View {
    @State private var rBreath = false
    @State private var lBreath = false
    @State private var mrBreath = false
    @State private var mlBreath = false
    @State private var showShadow = false
    @State private var showRightStroke = false
    @State private var showLeftStroke = false
    @State private var showInhale = true
    @State private var showExhale = false
    
    let screenFrame = Color(#colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1))
    var body: some View {
        ZStack {
            screenFrame
                .edgesIgnoringSafeArea(.all)
            
            Text("Breath In")
                .font(.largeTitle)
                .foregroundColor(Color(#colorLiteral(red: 0.4513868093, green: 0.9930960536, blue: 1, alpha: 1)))
                .opacity(showInhale ? 0 : 1)
                .scaleEffect(showInhale ? 0 : 1, anchor: .center)
                .offset(y: -300)
                .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                .onAppear {
                    showInhale.toggle()
                }
            
                Text("Breath Out")
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)))
                    .font(.largeTitle)
                    .opacity(showExhale ? 0 : 1)
                    .offset(y: -300)
                    .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                    .onAppear {
                    showExhale.toggle()
                }
            
            
            
            ZStack {
                Image("flower")  // Middle
                    .rotationEffect(.degrees(0), anchor: .bottom)
               
                Image("flower")  // Middle left
                Image("flower")  // Left
                    .rotationEffect(.degrees( mlBreath ? -25 : -5), anchor: .bottom)
                    .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                    .onAppear {
                        mlBreath.toggle()
                    }
                
                Image("flower")  // Middle right
                Image("flower")  // Right
                    .rotationEffect(.degrees( mrBreath ? 25 : 5), anchor: .bottom)
                    .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                    .onAppear {
                        mrBreath.toggle()
                    }
                
                Image("flower")  // Left
                    .rotationEffect(.degrees( lBreath ? -50 : -10), anchor: .bottom)
                    .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                    .onAppear {
                        lBreath.toggle()
                    }
                
                Image("flower")  // Right
                    .rotationEffect(.degrees( rBreath ? 50 : 10), anchor: .bottom)
                    .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                    .onAppear {
                        rBreath.toggle()
                    }
                
            }.shadow(radius: showShadow ? 20 : 0)
            .hueRotation(Angle(degrees: showShadow ? 0 : 180))
             .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
             .onAppear {
                showShadow.toggle()
            }
            
            Circle()  // Left Stroke
                .trim(from: showLeftStroke ? 0 : 1/4, to: 1/4)
                .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round, dash: [7, 14]))
                .frame(width: 215, height: 2215, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                .rotationEffect(.degrees(-180), anchor: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .offset(x: 0, y: -25)
                .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                .onAppear {
                    showLeftStroke.toggle()
               }
            
            Circle()  // Right stroke
                .trim(from: 0, to: showRightStroke ? 1/4 : 0)
                .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round, dash: [7, 14]))
                .frame(width: 215, height: 2215, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                .rotationEffect(.degrees(-90), anchor: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .offset(x: 0, y: -25)
                .animation(Animation.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true))
                .onAppear {
                    showRightStroke.toggle()
               }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
