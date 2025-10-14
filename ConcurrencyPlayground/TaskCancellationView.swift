//
//  TaskCancellationView.swift
//  ConcurrencyPlayground
//
//  Created by Oleh Zimin on 14.10.2025.
//

import SwiftUI

struct TaskCancellationView: View {
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
            uiImage = await ImageSevice.fetchRandomImage(size: 200)
        }
    }
}

#Preview {
    TaskCancellationView()
}
