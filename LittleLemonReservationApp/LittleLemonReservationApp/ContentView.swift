//
//  ContentView.swift
//  LittleLemonReservationApp
//
//  Created by Fatima Rao on 03/05/2023.
//

import SwiftUI

struct ContentView: View { 
    @StateObject var model = Model()
    @State var tabSelection = 0
    var body: some View {
        TabView(selection: $model.tabViewSelectedIndex)
        {
            LocationsVIew()
                .tag(0)
                .tabItem({
                    if(!model.displayReservationForm)
                    {
                        Label("Locations",systemImage: "fork.knife")
                    }
                })
            ReservationView()
                .tag(1)
                .tabItem({
                    if(!model.displayReservationForm)
                    {
                        Label("Reservations",systemImage: "square.and.pencil")
                    }
                })
        }.environmentObject(model)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
