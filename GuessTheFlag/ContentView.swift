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
            
            RadialGradient(stops : [
                .init(color: Color(red: 0.3 , green: 0.3, blue : 0.9), location: 0.3),
                .init(color: Color(red: 0.4 , green: 0.6, blue : 0.8), location: 0.3)],
                           center: .top, startRadius:200, endRadius: 700)
            .ignoresSafeArea()
          
          
            VStack{
               
                Spacer()
                
                Text("Guess the flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                
                VStack(spacing: 15){
                    
                    VStack{
                        
                        Text("Tap the right flag")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        
                        Text(counturies[correctAnswer])
                            .foregroundStyle(.black)
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
                }
               
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial.opacity(0.8))
                .clipShape(.rect(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                VStack{
                    Text("🎯Your Score: \(scoreTotal)")
                        .foregroundStyle(.white)
                        .font(.title.bold())
                }
              
                Spacer()
                
            }
            .padding()
           
            
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

