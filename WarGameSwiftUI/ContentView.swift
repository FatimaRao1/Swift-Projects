//
//  ContentView.swift
//  WarGameSwiftUI
//
//  Created by Fatima Rao on 22/10/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var leftCard = "card9"
    @State private var rightCard = "card10"
    @State private var playerScore = 0
    @State private var cpuScore = 0
    var body: some View {
        ZStack() {
            Image("Background").ignoresSafeArea()
            
            //if i add spacer here ,then both the spacers will take equal space. logo darmyan mn aa jayega.
         /*Spacer()
            Image("logo").resizable().aspectRatio(contentMode: .fit)
            Spacer()  //it takes all the available space and pushes the elements away.
            HStack() //spaing 3
            {
                Spacer()
                Text("Hello")
                Spacer()
                Text("World")
                Spacer()
            }
            Spacer()
          */
            VStack
            {
                Spacer()
                Image("logo")
                Spacer()
                    HStack(spacing:30)
                    {
                        Spacer()
                        Image(leftCard)
                        Spacer()
                        Image(rightCard)
                        Spacer()
                    }
                    Spacer()
                Button {
                    let leftNumber = Int.random(in: 2...14)
                    let rightNumber = Int.random(in: 2...14)
                    leftCard = "card\(leftNumber)"
                    rightCard = "card\(rightNumber)"
                    if leftNumber>rightNumber
                    {
                        playerScore+=1
                    }
                    else if rightNumber>leftNumber
                    {
                        cpuScore+=1
                    }
                    else
                    {
                    }
                } label: {
                    Image("dealbutton")
                }

                    Spacer()
                    HStack()
                    {
                        Spacer()
                        VStack()
                        {
                            Text("Player").font(.headline).foregroundColor(Color.white).padding(.bottom, 10.0)
                            Text(String(playerScore)).font(.largeTitle).foregroundColor(Color.white)
                        }
                        Spacer()
                        VStack()
                        {
                            Text("CPU").font(.headline).foregroundColor(Color.white).padding(.bottom, 10.0)
                            Text(String(cpuScore)).font(.largeTitle).foregroundColor(Color.white)
                        }
                        Spacer()
                    }
                    Spacer()
            }
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
