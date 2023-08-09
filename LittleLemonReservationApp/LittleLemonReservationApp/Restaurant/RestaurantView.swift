//
//  RestaurantView.swift
//  LittleLemonReservationApp
//
//  Created by Fatima Rao on 06/05/2023.
//

import SwiftUI

struct RestaurantView: View {
    var restaurant : RestaurantLocation
    init(_ restuarant: RestaurantLocation)
    {
        self.restaurant = restuarant
    }
    var body: some View {
        VStack (alignment: .leading, spacing:3){
          Text(restaurant.city)
            .font(.title2)
          
          HStack {
            Text(restaurant.neighborhood)
            Text("–")
            Text(restaurant.phoneNumber)
          }
          .font(.caption)
          .foregroundColor(.gray)

        }
    }
}

struct RestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleRestaurant =
        RestaurantLocation(
            city: "Islamabad",
        neighborhood: "H-9",
        phoneNumber: "(+92)-305234")
        RestaurantView(sampleRestaurant)
    }
}
