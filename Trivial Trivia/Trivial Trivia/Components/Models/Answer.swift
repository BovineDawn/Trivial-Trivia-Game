//
//  Answer.swift
//  Trivial Trivia
//
//  Created by JG on 1/1/23.
//

import Foundation

struct Answer: Identifiable {
    var id = UUID()
    var text: AttributedString
    var isCorrect: Bool
}
