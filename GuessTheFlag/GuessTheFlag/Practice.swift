//
//  Practice.swift
//  GuessTheFlag
//
//  Created by Fatima Rao on 30/07/2023.
//

import SwiftUI

struct Practice: View {
    @State var showingAlert = false
    var body: some View {
        //        LinearGradient(gradient: Gradient(stops:[
        //            Gradient.Stop(color: .mint, location: 0.45),
        //            Gradient.Stop(color: .indigo, location: 0.55)
        //            ]), startPoint: .top, endPoint: .bottom)
        //        ZStack{
        //            VStack(spacing: 0){
        //                Color.mint
        //                Color.indigo
        //            }
        //            Text("Your Content Here")
        //                .foregroundColor(.secondary)
        //                .padding()
        //                .background(.ultraThinMaterial)
        //        }
        //        RadialGradient(gradient: Gradient(colors: [.blue,.black]), center: .center, startRadius: 20, endRadius: 200)
        //        AngularGradient(gradient: Gradient(colors: [.mint,.blue,.cyan,.indigo,.teal,.purple]), center: .center)
                
                Button{
                    showingAlert = true
                }label: {
                    Label("Home", systemImage: "house")
                }
                .alert("Important Message", isPresented: $showingAlert)
                {
                    Button("Delete",role: .destructive){}
                    Button("Cancel",role:.cancel){}
                    
                }message: {
                    Text("your house is at fire")
                }
                
            }
    }

func executeSomething()
{
    print("Hello Fatima!")
}
struct Practice_Previews: PreviewProvider {
    static var previews: some View {
        Practice()
    }
}
