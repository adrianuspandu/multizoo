//
//  GameView.swift
//  Edutainment
//
//  Created by student on 10.04.25.
//

import SwiftUI

struct GameView: View {
    @Binding var gameState: GameState
    @Binding var questions: [Question]
    @Binding var questionIndex: Int
    
    @Binding var selectedTable: Int
    @Binding var amountOfQuestionsSelected: Int
    
    @State var score: Int = 0
    
    private var round: Int {
        questionIndex + 1
    }
    
    @State private var isGameOver = false
    
    var currentQuestion: Question {
        return questions[questionIndex]
    }
    
    let populateQuestions: (Int, Int) -> ()
    let generateNewQuestion: (Int, Int) -> Question
    
    var body: some View {
        if !isGameOver {
            VStack(alignment: .center) {
                Text("SCORE: \(score) / \(questionIndex)")
                    .font(.custom("Chewy-Regular", size: 24))
                    .foregroundStyle(.yellowZoo)
                    .glowBorder(color: .brownZoo, lineWidth: 4)
                    .kerning(2.4)
                
                Text("ROUND \(round)")
                    .font(.custom("Chewy-Regular", size: 64))
                    .foregroundStyle(.yellowZoo)
                    .glowBorder(color: .brownZoo, lineWidth: 4)
                    .kerning(5.8)
                
                ZStack {
                    Image("plank-big")
                    VStack() {
                        Text("WHAT IS")
                            .font(.custom("Chewy-Regular", size: 40))
                            .foregroundStyle(.yellowZoo)
                            .glowBorder(color: .brownZoo, lineWidth: 4)
                            .kerning(5.8)
                        Text("\(currentQuestion.text)?")
                            .font(.custom("Chewy-Regular", size: 64))
                            .foregroundStyle(.yellowZoo)
                            .glowBorder(color: .brownZoo, lineWidth: 4)
                            .kerning(5.8)
                    }
                }
                
                
                VStack(spacing: 30) {
                    ForEach(currentQuestion.answers, id: \.self) { answer in
                        Button("\(answer)") {
                            submitAnswer(answer, toQuestion: currentQuestion)
                        }
                        .font(.custom("Chewy-Regular", size: 40))
                        .padding(.horizontal, 48)
                        .padding(.vertical, 16)
                        .background(.blue)
                        .foregroundStyle(.white)
                        .cornerRadius(40)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .inset(by: 1)
                                .stroke(.black, lineWidth: 2)
                        )
                    }
                }
                
                Spacer()
            }
            .padding(.vertical, 100)
            
        } else {
            VStack {
                Text("GAME OVER")
                    .font(.custom("Chewy-Regular", size: 48))
                    .foregroundStyle(.yellowZoo)
                    .glowBorder(color: .brownZoo, lineWidth: 4)
                    .kerning(5.8)
                
                ZStack {
                    Image("plank-big")
                    VStack() {
                        Text("SCORE:")
                            .font(.custom("Chewy-Regular", size: 40))
                            .foregroundStyle(.yellowZoo)
                            .glowBorder(color: .brownZoo, lineWidth: 4)
                            .kerning(5.8)
                        Text("\(score) / \(round)")
                            .font(.custom("Chewy-Regular", size: 64))
                            .foregroundStyle(.yellowZoo)
                            .glowBorder(color: .brownZoo, lineWidth: 4)
                            .kerning(5.8)
                    }
                }
                
                VStack(spacing: 20) {
                    Button("RESTART") {
                        restartGame()
                    }
                    .font(.custom("Chewy-Regular", size: 40))
                    .frame(width: 280)
                    .padding(.vertical, 16)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .cornerRadius(40)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .inset(by: 1)
                            .stroke(.black, lineWidth: 2)
                    )
                    
                    
                    Button("NEW GAME") {
                        newGame()
                    }
                    .font(.custom("Chewy-Regular", size: 40))
                    .frame(width: 280)
                    .padding(.vertical, 16)
                    .background(.white)
                    .foregroundStyle(.blue)
                    .cornerRadius(40)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .inset(by: 1)
                            .stroke(.black, lineWidth: 2)
                    )
                    
                }
            }
        }
    }
    
    func submitAnswer(_ answer: Int, toQuestion question: Question) {
        if answer == currentQuestion.correctAnswer {
            score += 1
        }
        
        if questionIndex < questions.count - 1 {
            questionIndex += 1
        } else {
            isGameOver = true
        }
    }
    
    func restartGame() {
        questionIndex = 0
        score = 0
        isGameOver = false
        
        populateQuestions(selectedTable, amountOfQuestionsSelected)
    }
    
    func newGame() {
        questionIndex = 0
        score = 0
        isGameOver = false
        
        gameState = .settings
    }
}

#Preview {
    //    GameView()
}
