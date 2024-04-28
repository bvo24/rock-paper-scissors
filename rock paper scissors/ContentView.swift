//
//  ContentView.swift
//  rock paper scissors
//
//  Created by Brian Vo on 4/28/24.
//

import SwiftUI

struct ContentView: View {
    
    let emojiMap : [String : String] = [
        "rock" : "🗿",
        "paper" : "💸",
        "scissor" : "✂️"
        
    ]
    
    @State private var choice = ["rock", "paper", "scissor"]
    
    @State private var scoreTitle = ""
    let winChoice = ["paper", "scissor", "rock"]
    let loseChoice = ["scissor", "rock", "paper"]
    @State private var scoreMessage = ""
    @State private var endGame = false
    @State private var score = 0
    @State private var totalGames = 0
    
    @State private var appChoice : Int = Int.random(in: 0...2)
    @State private var winBool : Bool = Bool.random()
    @State private var showingScore = false
    
    var body: some View {
        
        VStack{
            VStack{
                
                Spacer()
                VStack{
                    Text("Score : \(score)")
                }
                
                VStack{
                    Text("CPU choice \(choice[appChoice])")
                }
                
                VStack{
                    if(winBool){
                        Text("Win!")
                    }
                    else{
                        Text("Lose.")
                    }
                    
                }
                Spacer()
                HStack(spacing: 50){
                    ForEach(0..<3){number in
                        Button{
                            buttonTapped(number)
                            
                        }label: {
                            Text(emojiMap[choice[number]] ?? choice[number])
                                .font(.system(size: 60))
                        }
                    }
                }
                Spacer()
            }
            
        }
        .alert(scoreTitle, isPresented: $showingScore){
            Button("Continue", action : newGame)
        }message: {
            Text(scoreMessage)
        }
        .alert(scoreTitle, isPresented: $endGame){
            Button("New game", action : newGame)
        }message: {
            Text(scoreMessage)
            
        }
        
    }
    
    func buttonTapped(_ number : Int){
        
        if(winBool){
            
            if(choice[appChoice] == "rock"){
                if(choice[number] == "paper"){
                    score += 1
                    scoreTitle = "Correct!"
                    scoreMessage = "Congrats +1"
                }
                else{
                    score -= 1
                    scoreTitle = "Incorrect"
                    scoreMessage = "Congrats -1"
                }
                
            }
            
            if(choice[appChoice] == "scissor"){
                if(choice[number] == "rock"){
                    score += 1
                    scoreTitle = "Correct!"
                    scoreMessage = "Congrats +1"
                }
                else{
                    score -= 1
                    scoreTitle = "Incorrect!"
                    scoreMessage = "Congrats -1"
                }
                
            }
            
            if(choice[appChoice] == "paper"){
                if(choice[number] == "scissor"){
                    
                    score += 1
                    scoreTitle = "Correct!"
                    scoreMessage = "Congrats +1"
                }
                else{
                    score -= 1
                    scoreTitle = "Incorrect!"
                    scoreMessage = "Congrats -1"
                }
                
            }
            
            
            
            
        }
        if(!winBool){
            
            if(choice[appChoice] == "rock"){
                if(choice[number] == "scissor"){
                    
                    score += 1
                    scoreTitle = "Correct!"
                    scoreMessage = "Congrats +1"
                }
                else{
                    score -= 1
                    scoreTitle = "Incorrect!"
                    scoreMessage = "Congrats -1"
                }
                
            }
            if(choice[appChoice] == "paper"){
                if(choice[number] == "rock"){
                    score += 1
                    scoreTitle = "Correct!"
                    scoreMessage = "Congrats +1"
                }
                else{
                    score -= 1
                    scoreTitle = "Incorrect!"
                    scoreMessage = "Congrats -1"
                }
                
            }
            if(choice[appChoice] == "scissor"){
                if(choice[number] == "paper"){
                    score += 1
                    scoreTitle = "Correct!"
                    scoreMessage = "Congrats +1"
                }
                else{
                    score -= 1
                    scoreTitle = "Incorrect!"
                    scoreMessage = "Congrats -1"
                }
                
            }
            
            
            
            
        }
        showingScore = true
        
    }
    
    func newGame(){
        winBool = Bool.random()
        choice.shuffle()
        appChoice = Int.random(in: 0...2)
        
        totalGames += 1
        
        if(totalGames == 10){
            endGame = true
            scoreTitle = "Game over! womp"
            scoreMessage = "\(score) / 10"
            score = 0
            
            
        }
        
    }
}

#Preview {
    ContentView()
}
