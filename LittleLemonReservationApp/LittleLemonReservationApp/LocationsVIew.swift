//
//  LocationsVIew.swift
//  LittleLemonReservationApp
//
//  Created by Fatima Rao on 04/05/2023.
//

import SwiftUI

struct LocationsVIew: View {
    @EnvironmentObject var model:Model
    var body: some View {
        VStack {
            LogoView()
                .padding(.top,10)
            Text (model.displayReservationForm ? "Reservation Details" :
                    "Select a location")
                .padding([.trailing,.leading],40)
                .padding([.top,.bottom],8)
                .background(.gray.opacity(0.4))
                .cornerRadius(50)
            NavigationView {
                List(model.restaurants, id: \.self) { restaurant in
                    NavigationLink(destination: ReservationForm(restaurant)) {
                        RestaurantView(restaurant)
                    }
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
                
                
            }
            .onAppear
            {
                model.displayReservationForm = false
            }
            .onDisappear{
                if model.tabBarChanged { return }
                model.displayReservationForm = true
            }
            .frame(maxHeight: .infinity)
            .padding(.top,-10)
            .scrollContentBackground(.hidden)
            
        }
        .padding()
    }
}

struct LocationsVIew_Previews: PreviewProvider {
    static var previews: some View {
        LocationsVIew().environmentObject(Model())
    }
}
