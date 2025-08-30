//
//  ContentView.swift
//  OutfitRater
//
//  Created by Joseph Kevin Fredric on 30/8/25.
//

import SwiftUI

struct ContentView: View {
    @State private var rating = 5
    @State private var text = "tetetetetetetzsvhz zghzxjjcb"
    @State private var showIntro = true
    
    var body: some View {
        NavigationStack{
            ZStack {
                VStack {
                    SpeechBubble(text: $text)
                    
                    Spacer()
                    NavigationLink{
                        Imager()
                    }label:{
                        ZStack{
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.red.opacity(0.7))
                                .frame(width: 200, height: 50)
                            Text("Take Photo / Pick Photo")
                                .foregroundStyle(.white)
                        }
                        
                    }
                    RatingBar(rating: $rating)
                        .padding(.bottom, 10)
                }
                .padding()
                
                if showIntro {
                    Color.black.opacity(0.4)
                        .ignoresSafeArea()
                    
                    VStack(spacing: 20) {
                        Text("Welcome!")
                            .font(.largeTitle.bold())
                            .foregroundStyle(.black)
                        
                        Text("Disclaimer")
                            .font(.headline)
                            .foregroundColor(.red)
                            .bold()
                        
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .frame(width: 120, height: 40)
                                    .foregroundStyle(.red.opacity(0.3))
                                
                            )
                        
                        Text("This app is awfully honest, so do take their comments to heart")
                            .multilineTextAlignment(.center)
                            .padding()
                            .foregroundColor(.black)
                        
                        Button {
                            withAnimation(.spring()) {
                                showIntro = false
                            }
                        } label: {
                            Text("Start")
                                .font(.headline.bold())
                                .foregroundStyle(.black)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(
                                    Color.white.opacity(0.3)
                                )
                                .cornerRadius(15)
                                .shadow(radius: 5)
                        }
                    }
                    .padding(30)
                    .background(.ultraThinMaterial)
                    .cornerRadius(25)
                    
                    .padding(20)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
