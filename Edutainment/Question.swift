//
//  Question.swift
//  Edutainment
//
//  Created by student on 10.04.25.
//


struct Question: Hashable {
    let text: String
    let correctAnswer: Int
    let answers: [Int]
    
    init(firstOperand: Int, secondOperand: Int) {
        self.correctAnswer = firstOperand * secondOperand
        self.text = "\(firstOperand) × \(secondOperand)"
        
        self.answers = [
            correctAnswer,
            correctAnswer + Int.random(in: 1...correctAnswer / 2 + 1),
            correctAnswer - Int.random(in: 1...correctAnswer / 2)
        ].shuffled()
    }
}
