//
//  ContentView.swift
//  Memento Mori
//
//  Created by Kamil Rudnicki on 26/04/2020.
//  Copyright © 2020 TimeCamp S.A. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var end = Date()
    
    func yes() {
        color = Color(UIColor.random())
    }
    func no() {
        color = .primary
    }
    
    @State var size: CGFloat = 0.95
    @State var color: Color = .primary

    var foreverAnimation: Animation {
        Animation.easeInOut(duration: 2)
            .repeatForever()
    }
    
    var body: some View {
        VStack {
            
            Image("fall-leaves")
                .resizable()
                .scaledToFit()
                .padding(.bottom, 30.0)
                .padding(.top, 60.0)
            
            VStack {
                Text(String(format:"%@ tygodni", weeks()))
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 30.0)
                    //.foregroundColor(color)
                    .padding(.top, 60.0)
                    .scaleEffect(size)
                    //.animation(.easeInOut)
                    //.foregroundColor(color)
                    //.colorMultiply(color)
                    .onAppear() {
                        withAnimation(self.foreverAnimation) { self.size = 1.05 }
                    }
                
            }
            
            //If today were the last day of my life, \nwould I want to do what I have done today?
            
            //Co bys zrobil gdyby to byly ostatnie dwa lata Twojego życia?
            
            Text("Gdyby dzisiejszy dzień był ostatnim dniem mojego życia, czy zrobiłbym to samo?")
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding()
                //.foregroundColor(color)
                .foregroundColor(Color.white)
                .colorMultiply(color)
                .animation(.easeInOut)
            
            HStack {
//                Button("Tak", action: yes)
//                    .foregroundColor(Color(UIColor.systemBackground))
//                    .padding(.horizontal, 40.0)
//                    .padding(.vertical, 10.0)
//                    .background(LinearGradient(gradient: Gradient(colors: [Color.primary, Color.primary]), startPoint: .leading, endPoint: .trailing))
//                    .border(Color.primary, width: /*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                
                Text("Tak")
                    .fontWeight(.bold)
                    .padding(.horizontal, 20.0)
                    .hoverEffect(.lift)
                    .foregroundColor(Color.white)
                    .colorMultiply(color)
                    .animation(.easeInOut)
                    .onTapGesture {
                        self.yes()
                    }
                    
//                Text("/")
                    //.color(.gray)
                
                Text("Nie")
                    .fontWeight(.bold)
                    .padding(.horizontal, 20.0)
                    .hoverEffect(.lift)
                    .foregroundColor(Color.white)
                    .colorMultiply(color)
                    .animation(.easeInOut)
                    .onTapGesture {
                        self.no()
                    }
                
//                Button("Nie", action: no)
//                    .foregroundColor(Color.primary)
//                    .padding(.horizontal, 40.0)
//                    .padding(.vertical, 10.0)
//                    .border(Color.primary, width: 2)
            }
            .padding(.bottom, 50.0)
            .padding(.top, 40.0)
            

                
            ZStack {
                ForEach(0 ..< 0) { x in
                    ForEach(0 ..< 0) { y in
                        Rectangle()
                            .fill(Color.primary)
                            .frame(width: 4, height: 4)
                            .position(x: CGFloat(x*6), y: CGFloat(y*6))
                    }
                }
            }
            .padding(10.0)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
