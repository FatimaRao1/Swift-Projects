//
//  MenuItemOptionsView.swift
//  LittleLemonDinnerMenu
//
//  Created by Fatima Rao on 01/07/2023.
//

import SwiftUI

struct MenuItemOptionsView: View {
    @EnvironmentObject private var viewModel : MenuViewViewModel
    var body: some View {
        NavigationView{
            NavigationStack{
                List
                {
                    Section("Selected Categories")
                    {
                        Toggle(MenuCategory.food.rawValue, isOn: $viewModel.isShowFood)
                        Toggle(MenuCategory.drink.rawValue, isOn: $viewModel.isShowDrinks)
                        Toggle(MenuCategory.dessert.rawValue, isOn: $viewModel.isShowDesserts)
                    }
                    Picker("SortBy", selection: $viewModel.sortBy)
                    {
                        ForEach(SortBy.allCases, id: \.self) { category in
                            Text(category.rawValue).tag(category)
                        }
                    }
                }.pickerStyle(.inline)
                    .listStyle(.grouped)
            }.navigationTitle("Filter")
            
        }
    }
}

struct MenuItemOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemOptionsView().environmentObject(MenuViewViewModel())
    }
}
