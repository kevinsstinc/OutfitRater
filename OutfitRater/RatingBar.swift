//
//  RatingBar.swift
//  OutfitRater
//
//  Created by Joseph Kevin Fredric on 30/8/25.
//


import SwiftUI

struct RatingBar: View {
    @Binding var rating: Int
    
    var body: some View {
        VStack {
            Text("\(rating)/10")
                .font(.title)
                .padding(.bottom, 4)
            
            HStack(spacing: 6) {
                ForEach(1...10, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(index <= rating ? Color.red : Color.gray, lineWidth: 4)
                        .background(
                            RoundedRectangle(cornerRadius: 4)
                                .fill(index <= rating ? Color.red.opacity(0.7) : Color.clear)
                               
                        )
                        .frame(width: 24, height: 36)
                        .padding(.horizontal, 2)
                        .onTapGesture {
                            rating = index
                        }
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(Color.gray, lineWidth: 5)
            )
        }
    }
}


