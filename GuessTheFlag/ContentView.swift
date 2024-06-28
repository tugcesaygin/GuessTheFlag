//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Tuğçe Saygın on 27.06.2024.
//

import SwiftUI

struct ContentView: View {
  
    
    @State private var counturies = ["Estonia", "Turkiye", "France" , "Germany" , "Ireland", "Italy" , "Nigeria" , "Poland" , "Spain" , "UK" , "Ukraine" , "US" ].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State private var scoreTotal = 0
                        
    var body: some View {
        
        ZStack{
            
            
            LinearGradient(colors: [.teal, .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
          
    
            VStack(spacing: 30){
                VStack{
                
                    Text("Tap the right flag")
                        .foregroundStyle(.white)
                        .font(.subheadline.weight(.heavy))
                    
                    Text(counturies[correctAnswer])
                        .foregroundStyle(.white)
                        .font(.largeTitle.weight(.semibold))
                    
                }
                VStack(spacing: 30){
                    ForEach(0..<3){ number in
                        Button{
                            flagTapped(number)
                        }label :{
                            Image(counturies[number])
                                .clipShape(.capsule)
                                .shadow(radius: 8)
                        }
                        
                    }
                }
                
                VStack{
                    Text("🎯Your Score: \(scoreTotal)")
                        .foregroundStyle(.white)
                        .font(.title)
                }
                
            }
            

            
        }
        
        
        .alert(scoreTitle, isPresented: $showingScore){
            Button("Continue", action: askQuestion)
        }
        
        
    }
    
    func flagTapped(_ number: Int){
        if number == correctAnswer{
            scoreTitle = "Correct 🎉"
            scoreTotal += 1
            
        }else{
            scoreTitle = "Wrong, try again."
            scoreTotal = 0
        }
        showingScore = true
    }
    
    func askQuestion(){
        counturies.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
  
}

#Preview {
    ContentView()
}

