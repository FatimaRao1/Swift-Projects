//
//  Model.swift
//  LittleLemonReservationApp
//
//  Created by Fatima Rao on 06/05/2023.
//

import Foundation
class Model:ObservableObject
{
    let restaurants = [
    RestaurantLocation(city: "Islamabad",
                      neighborhood: "I8",
                      phoneNumber: "(+92)-302344"),
    RestaurantLocation(city: "Rawalpindi",
                      neighborhood: "Adyala",
                      phoneNumber: "(+92)-310324"),
    RestaurantLocation(city: "Murree",
                      neighborhood: "Nathiagali",
                      phoneNumber: "(+92)-334546"),
    RestaurantLocation(city: "Lahore",
                      neighborhood: "Muslim Town",
                      phoneNumber: "(+92)-234435")
    ]
    @Published var reservation = Reservation()
    @Published var displayReservationForm = false
    @Published var temporaryReservation = Reservation()
    @Published var followNavitationLink = false
    
    @Published var displayTabBar = true
    @Published var tabBarChanged = false
    @Published var tabViewSelectedIndex = Int.max {
      didSet {
        tabBarChanged = true
      }
    }
}
