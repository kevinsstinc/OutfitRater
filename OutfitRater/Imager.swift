//
//  Imager.swift
//  OutfitRater
//
//  Created by Joseph Kevin Fredric on 30/8/25.
//


import SwiftUI
import PhotosUI

struct Imager: View {
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var capturedImage: UIImage? = nil

    var body: some View {
        VStack(spacing: 20) {
            if let image = capturedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .cornerRadius(12)
            } else {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 300)
                    .overlay(Text("No Image").foregroundStyle(.white))
            }

            PhotosPicker(
                selection: $selectedItem,
                matching: .images,
                photoLibrary: .shared()) {
                    Label("Pick Photo / Take Photo", systemImage: "camera")
                        .padding()
                        .background(Color.red.opacity(0.7))
                        .foregroundStyle(.white)
                        .cornerRadius(10)
                }
                .onChange(of: selectedItem) { oldValue, newValue in
                    Task {
                        if let data = try? await newValue?.loadTransferable(type: Data.self),
                           let uiImage = UIImage(data: data) {
                            capturedImage = uiImage
                        }
                    }
                }

            Spacer()
        }
        .padding()
    }
}


#Preview {
    Imager()
}
