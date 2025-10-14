//
//  ImageSevice.swift
//  ConcurrencyPlayground
//
//  Created by Oleh Zimin on 14.10.2025.
//

import SwiftUI

enum ImageSevice {
    static func fetchRandomImage(size: Int) async -> UIImage? {
        var image: UIImage? = nil
        
        do {
            guard let url = URL(string: "https://picsum.photos/\(size)") else {
                throw URLError(.badURL)
            }
            let (data, _) = try await URLSession.shared.data(from: url)
            
            image = UIImage(data: data)
        } catch {
            print(error)
        }
        
        return image
    }
}
