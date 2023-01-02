//
//  Trivial.swift
//  Trivial Trivia
//
//  Created by JG on 1/1/23.
//

import Foundation

struct Trivia: Decodable {
    var results: [Result]
    
    struct Result: Decodable, Identifiable {
        var id: UUID  {
            UUID()
        }
        var category: String
        var type: String
        var difficulty: String
        var question: String
        var correctAnswer: String
        var incorrectAnswers: [String]
        
        var formattedQuestion: AttributedString {
            do {
                return try AttributedString(markdown: question)
            } catch {
                print("Error setting formattedQuestion: \(error)")
                return ""
            }
        }
        
        var answers: [Answer] {
            do {
                let correct = [Answer(text: try AttributedString(markdown: correctAnswer), isCorrect: true)]
                let incorrect = try incorrectAnswers.map { answers in
                    Answer(text: try AttributedString(markdown: answers), isCorrect: false)
                }
                let allAnswers = correct + incorrect
                
                return allAnswers.shuffled()
            } catch {
                print("Error setting answers: \(error)")
                return []
            }
        }
    }
}

