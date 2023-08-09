//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Fatima Rao on 30/07/2023.
//

import SwiftUI
struct FlagImage:View
{
    let country: String
    var body : some View{
        Image(country)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 10)
    }
}
struct BlueTitle:ViewModifier
{
    func body(content: Content) -> some View {
        content
            .foregroundColor(.blue)
            .font(.largeTitle)
    }
}
extension View
{
    func LargeBlueTitle()->some View{
        modifier(BlueTitle())
    }
}
struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var totalScore = 0
    @State private var countries = ["Estonia","France","Germany","Ireland","Italy","Monaco","Nigeria"].shuffled()
    @State private var endGame = false
    @State private var totalQuestions = 0
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack{
//            LinearGradient(gradient: Gradient(colors: [.blue,.black]), startPoint: .top, endPoint: .bottom)
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 300, endRadius: 400)
            VStack
            {
                Spacer()
                Text("Guess The Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                VStack(spacing:20)
                {
                    VStack()
                    {
                        Text("Select the flag of ")
//                            .font(.subheadline.weight(.heavy))
//                            .foregroundStyle(.secondary)
                            .LargeBlueTitle()
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                        
                        
                    }.foregroundColor(.black)
                    ForEach(0..<3)
                    {number in
                        Button{
                            flagTapped(number)
                        }label: {
//                            Image(countries[number])
//                                .renderingMode(.original)
//                                .clipShape(Capsule())
//                                .shadow(radius: 10)
                            FlagImage(country: countries[number])
                        }
                        .alert(scoreTitle, isPresented: $showingScore)
                        {
                            Button("Continue",action: askQuestion)
                        }message: {
                            Text("Your Score is \(totalScore)")
                        }
                    }
                }.frame(maxWidth: .infinity)
                    .padding(.vertical, 5)
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    Spacer()
                    Spacer()
                    Text("Score : \(totalScore)")
                        .foregroundColor(.white)
                        .font(.title.weight(.semibold))
                    Spacer()
                
            }
            .padding()
        }
        .ignoresSafeArea()
    }
    func flagTapped(_ number : Int)
    {
        totalQuestions+=1
        
        if(number==correctAnswer)
        {
            scoreTitle = "Correct"
            totalScore+=1
        }
        else
        {
            scoreTitle = "Wrong!Thats the flag of \(countries[number])"
            if(totalScore>0)
            {
                totalScore-=1
            }
        }
        showingScore = true
    }
    func askQuestion()
    {
        if(totalQuestions<=8)
        {
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
        }
        else
        {
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
