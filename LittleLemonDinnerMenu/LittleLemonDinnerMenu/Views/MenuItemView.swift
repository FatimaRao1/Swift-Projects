//
//  MenuItemView.swift
//  LittleLemonDinnerMenu
//
//  Created by Fatima Rao on 01/07/2023.

import SwiftUI

struct MenuItemView: View {
    
    @EnvironmentObject var viewModel: MenuViewViewModel
    var menuItems: [MenuItem]
    var menuCategory: MenuCategory
    init(menuItems: [MenuItem], menuCategory: MenuCategory) {
        self.menuItems = menuItems
        self.menuCategory = menuCategory
    }
    private var threeColumnGrid = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        VStack {
            HStack {
                Text(menuCategory.rawValue)
                    .font(.title)
                    .fontWeight(.medium)
                Spacer()
            }
            LazyVGrid(columns: threeColumnGrid) {
                ForEach((menuItems), id: \.self) { menuItem in
                    NavigationLink(destination: MenuItemDetailsView(menuItem: menuItem)) {
                        VStack {
                            Rectangle()
                            Text(menuItem.title)
                        }
                        .frame(height: 120)
                        .foregroundColor(.black)
                    }
                }
            }
        }
        .padding()
    }
}

struct MenuItemView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = MenuViewViewModel()
        MenuItemView(menuItems: viewModel.foods, menuCategory: .food)
    }
}
