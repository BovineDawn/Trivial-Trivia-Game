//
//  QuestionView.swift
//  Trivial Trivia
//
//  Created by JG on 1/1/23.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var trivialManager: TrivialManager
    
    var body: some View {
        VStack(spacing: 40) {
            HStack {
                
                Text("Trivial Trivia Game")
                    .lilacTitle()
                
                Spacer()
                
                Text("\(trivialManager.index + 1) out of \(trivialManager.length)")
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
            }
            
            ProgressBar(progress: trivialManager.progress)
            
            VStack(alignment: .leading, spacing: 20) {
                Text(trivialManager.question)
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .bold()
                
                ForEach(trivialManager.answerChoices, id:
                            \.id) { answer in
                    AnswerRow(answer: answer)
                        .environmentObject(trivialManager)
                }
            }
            Button {
                trivialManager.goToNextQuestion()
            } label: {
                PrimaryButton(text: "Next Question", background: trivialManager.answerSelected ? Color("AccentColor") : Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
            }
            .disabled(!trivialManager.answerSelected)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 0.103, green: 0.103, blue: 0.103))
        .navigationBarBackButtonHidden(true)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
            .environmentObject(TrivialManager())
    }
}
