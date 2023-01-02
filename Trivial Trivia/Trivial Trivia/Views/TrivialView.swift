//
//  TrivialView.swift
//  Trivial Trivia
//
//  Created by JG on 1/1/23.
//

import SwiftUI

struct TrivialView: View {
    @EnvironmentObject var trivialManager: TrivialManager
    
    var body: some View {
        if trivialManager.reachedEnd {
        VStack(spacing: 20) {
            Text("Trivial Trivia Game")
                .lilacTitle()
            
            Text("Congrats! You completed the game! 🥳")
            
            Text("You scored \(trivialManager.score) out of \(trivialManager.length)")
            
            Button {
                Task.init {
                    await trivialManager.fetchTrivial()
                }
            } label: {
                PrimaryButton(text: "Play Again")
            }
        }
        .foregroundColor(.white)
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.103, green: 0.103, blue: 0.103))
            } else {
                QuestionView()
                    .environmentObject(trivialManager)
            }
        
    }
    
    struct TrivialView_Previews: PreviewProvider {
        static var previews: some View {
            TrivialView()
                .environmentObject(TrivialManager())
        }
    }
}
