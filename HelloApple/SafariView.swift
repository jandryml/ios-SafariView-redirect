//
//  SafariView.swift
//  HelloApple
//
//  Created by Jan Dryml on 05.10.2024.
//

import SwiftUI
import SafariServices

struct ContentView2: View {
    @State private var showSafari = false

    var body: some View {
        VStack {
            Button(action: {
                showSafari = true
            }) {
                Text("Open Safari")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .sheet(isPresented: $showSafari) {
            SafariView(url: URL(string: "http://127.0.0.1:3000")!)
        }
    }
}

struct SafariView: UIViewControllerRepresentable {
    let url: URL

    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {
        // Leave empty for now
    }
}
