//
//  SettingsView.swift
//  Edutainment
//
//  Created by student on 10.04.25.
//

import SwiftUI

struct SettingsView: View {
    @Binding var gameState: GameState
    
    @Binding var selectedTable: Int
    @Binding var amountOfQuestionsSelected: Int
    @Binding var amountOfQuestions: [Int]
    
    @Binding var questions: [Question]
    
    let populateQuestions: (Int, Int) -> ()
    let generateNewQuestion: (Int, Int) -> Question
    
    var body: some View {
        VStack(spacing: 40) {
            
            VStack {
                Image(randomAnimal())
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(.bottom, -20)
                Text("MULTIZOO")
                    .font(.custom("Chewy-Regular", size: 64))
                    .kerning(5.8)
                    .foregroundStyle(.yellowZoo)
                    .glowBorder(color: .brownZoo, lineWidth: 6)
                
            }
            
            VStack(spacing: 5) {
                Text("TABLE")
                    .font(.custom("Chewy-Regular", size: 40))
                    .foregroundStyle(.yellowZoo)
                    .glowBorder(color: .brownZoo, lineWidth: 6)
                
                ZStack {
                    Image("plank-small")
                    Stepper("UP TO... \(selectedTable)", value: $selectedTable, in: 2...12)
                        .font(.custom("Chewy-Regular", size: 24))
                        .frame(width: 200, alignment: .center)
                    
                }
                
            }
            
            VStack(spacing: 5) {
                Text("QUESTIONS")
                    .font(.custom("Chewy-Regular", size: 40))
                    .foregroundStyle(.yellowZoo)
                    .glowBorder(color: .brownZoo, lineWidth: 6)
                
                
                ZStack {
                    Image("plank-small")
                    Picker("\(amountOfQuestionsSelected)", selection: $amountOfQuestionsSelected) {
                        ForEach(amountOfQuestions, id: \.self){
                            Text("\($0)")
                                .font(.custom("Chewy-Regular", size: 24))
                        }
                    }
                    .frame(width: 100, alignment: .center)
                    .pickerStyle(.wheel)
                    .accentColor(.black)
                }
                
            }
            
            Button("PLAY") {
                populateQuestions(selectedTable, amountOfQuestionsSelected)
                gameState = .game
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
            
            
            Spacer()
        }
        .padding(.vertical, 100)
    }
}

#Preview {
    //    SettingsView()
}
