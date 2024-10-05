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
    @State private var receivedURL: URL?

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

            if let url = receivedURL {
                Text("Received deep link: \(url.absoluteString)")
                    .padding()
            }
        }
        .sheet(isPresented: $showSafari) {
            SafariView(url: URL(string: "http://127.0.0.1:3000")!)
        }
        .onOpenURL { url in
            handleDeepLink(url)
            showSafari = false
        }
    }

    func handleDeepLink(_ url: URL) {
        // Update the state with the received URL
        receivedURL = url

        // Parse the URL and navigate accordingly
        if url.host == "openPage" {
            // For demonstration, we'll just print the URL
            print("Navigated back to app via deep link: \(url)")
        } else {
            print("Unhandled deep link: \(url)")
        }
    }
}

struct SafariView: UIViewControllerRepresentable {
    let url: URL

    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        // Leave empty for now
    }
}
