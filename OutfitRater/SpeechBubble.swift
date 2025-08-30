//
//  SpeechBubble.swift
//  OutfitRater
//
//  Created by Joseph Kevin Fredric on 30/8/25.
//


import SwiftUI
import AVFoundation

struct SpeechBubble: View {
    @Binding var text: String
    
    var body: some View {
        ZStack{
            
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color.red, lineWidth: 5)
                .fill(Color.red.opacity(0.7))
                .frame(width: 350, height: 120)
            Text(text)
                .foregroundStyle(.white)
                .font(.title2)
               
        }
        Circle()
            .fill(Color.red.opacity(0.7))
            .stroke(Color.red, lineWidth: 5)
            .frame(width: 40, height: 40)
            .offset(x: 144, y: 2)
        Circle()
            .fill(Color.red.opacity(0.7))
            .stroke(Color.red, lineWidth: 5)
            .frame(width: 20, height: 20)
            .offset(x: 148, y: 10)
            
    }
}

