//
//  Extensions.swift
//  Trivial Trivia
//
//  Created by JG on 1/1/23.
//

import Foundation
import SwiftUI

extension Text {
    func lilacTitle() -> some View {
        self.font(.title)
            .fontWeight(.heavy)
            .foregroundColor(.white)
    }
}
