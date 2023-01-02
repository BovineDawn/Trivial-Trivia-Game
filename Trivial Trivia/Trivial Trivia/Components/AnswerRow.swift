//
//  AnswerRow.swift
//  Trivial Trivia
//
//  Created by JG on 1/1/23.
//

import SwiftUI

struct AnswerRow: View {
    @EnvironmentObject var trivialManager: TrivialManager
    var answer: Answer
    @State private var isSelected = false
    
    var green = Color(hue: 0.437, saturation: 0.711, brightness: 0.711)
    var red = Color(red: 0.71, green: 0.083, blue: 0.1)
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "circle.fill")
                .font(.caption)
                .foregroundColor(.black)
            Text(answer.text)
                .bold()
                .foregroundColor(.black)
            
            if isSelected {
                Spacer()
                
                Image(systemName: answer.isCorrect ? "checkmark.square" : "x.circle.fill")
                    .foregroundColor(answer.isCorrect ? green : red)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(trivialManager.answerSelected ? (isSelected ? Color("AccentColor") : .gray) : Color("AccentColor"))
        .background(.white)
        .cornerRadius(10)
        .shadow(color: isSelected ? (answer.isCorrect ? green : red) : .gray, radius: 5, x: 0.5, y: 0.5)
        .onTapGesture {
            if !trivialManager.answerSelected {
                isSelected = true
                trivialManager.selectAnswer(answer: answer)
            }
            isSelected = true
        }
    }
}

struct AnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        AnswerRow(answer: Answer(text: "Double", isCorrect: false))
            .environmentObject(TrivialManager())
    }
}
