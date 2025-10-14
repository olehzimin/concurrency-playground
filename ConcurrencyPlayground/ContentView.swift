//
//  ContentView.swift
//  ConcurrencyPlayground
//
//  Created by Oleh Zimin on 14.10.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var screen: Screen = .concurrency
    
    var body: some View {
        NavigationStack {
            RouterView(screen: screen)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Menu {
                            HStack {
                                Button("Home", systemImage: (screen == .concurrency ? "chevron.right" : "")) {
                                    screen = .concurrency
                                }
                            }
                            Button("TaskCancellation", systemImage: (screen == .taskCancellation ? "chevron.right" : "")) {
                                screen = .taskCancellation
                            }
                        } label: {
                            Image(systemName: "ellipsis")
                        }
                    }
                }
        }
    }
}

struct RouterView: View {
    let screen: Screen
    
    var body: some View {
        switch screen {
        case .concurrency:
            HomeView()
        case .taskCancellation:
            TaskCancellationView()
        }
    }
}

enum Screen {
    case concurrency
    case taskCancellation
}

#Preview {
    ContentView()
}
