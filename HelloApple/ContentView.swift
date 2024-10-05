//
//  ContentView.swift
//  HelloApple
//
//  Created by Jan Dryml on 27.04.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button(
                action: { logIn() },
                label: { Label("Login",systemImage: "play.fill")}
            )

        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func logIn() {
    print("Heheis")
}
