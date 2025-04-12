//
//  ContentView.swift
//  Edutainment
//
//  Created by student on 09.04.25.
//

import SwiftUI

enum GameState {
    case settings, game
}

extension Font {
    static func useChewy(size: CGFloat) -> Font {
        .custom("Chewy-Regular", size: size)
    }
}

struct ContentView: View {
    // Game State
    @State private var gameState: GameState = .settings
    
    // User Settings
    @State private var selectedTable = 2
    @State private var amountOfQuestionsSelected = 5
    @State private var amountOfQuestions = [5, 10, 20]
    
    // Questions
    @State private var questions = [Question]()
    @State private var questionIndex = 0
    
    var body: some View {
        ZStack {
            Image("bg")
                .ignoresSafeArea()
            
            switch gameState {
            case .settings:
                SettingsView(
                    gameState: $gameState,
                    selectedTable: $selectedTable,
                    amountOfQuestionsSelected: $amountOfQuestionsSelected,
                    amountOfQuestions: $amountOfQuestions,
                    questions: $questions,
                    populateQuestions: populateQuestions,
                    generateNewQuestion: generateNewQuestion
                )
            case .game:
                GameView(
                    gameState: $gameState,
                    questions: $questions,
                    questionIndex: $questionIndex,
                    selectedTable: $selectedTable,
                    amountOfQuestionsSelected: $amountOfQuestionsSelected,
                    populateQuestions: populateQuestions,
                    generateNewQuestion: generateNewQuestion
                )
            }
        }
    }
    
    func populateQuestions(upTo selectedTable: Int, amount: Int) {
        questions.removeAll()
        for _ in 0..<amount {
            let firstOperand = Int.random(in: 2...selectedTable)
            let secondOperand = Int.random(in: 1...10)
            let newQuestion = generateNewQuestion(firstOperand, and: secondOperand)
            questions.append(newQuestion)
        }
    }
    
    func generateNewQuestion(_ firstOperand: Int, and secondOperand: Int) -> Question {
        return Question(firstOperand: firstOperand, secondOperand: secondOperand)
    }
    
}

#Preview {
    ContentView()
}
