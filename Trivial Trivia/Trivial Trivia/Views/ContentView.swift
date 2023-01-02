//
//  ContentView.swift
//  Trivial Trivia
//
//  Created by JG on 1/1/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var trivialManager = TrivialManager()
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                VStack(spacing: 20) {
                    Text("Trivial Trivia Game")
                        .lilacTitle()
                    
                    Text("Welcome to the ultimate trivia challenge! Are you ready to put your knowledge to the test?")
                        .foregroundColor(.white)
                }
                
                NavigationLink {
                    TrivialView()
                        .environmentObject(TrivialManager())
                } label: {
                    PrimaryButton(text: "Let's begin!")
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .background(Color(red: 0.103, green: 0.103, blue: 0.103))
            .foregroundColor(.white)
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
