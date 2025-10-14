//
//  HomeView.swift
//  ConcurrencyPlayground
//
//  Created by Oleh Zimin on 14.10.2025.
//

import SwiftUI

struct HomeView: View {
    @State private var uiImage: UIImage? = nil
    
    var body: some View {
        Group {
            if let uiImage {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
            } else {
                ProgressView()
            }
        }
        .frame(width: 200, height: 200)
        .task {
            try? await Task.sleep(for: .seconds(2))
            uiImage = await ImageSevice.fetchRandomImage(size: 200)
        }
        .navigationTitle("Concurrency")
    }
}

#Preview {
    HomeView()
}
