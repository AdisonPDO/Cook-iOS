//
//  ContentView.swift
//  MyAppCook
//
//  Created by Adison on 30/04/2020.
//  Copyright © 2020 Adison. All rights reserved.
//
import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView{
            ListView(colorUi: .systemPink, baseColor: Color(UIColor.systemPink), titleName: "Recettes", searchBarActiv: false, pickerSect: true)
                .tabItem{
                    Image(systemName: "list.bullet")
                    Text("Recettes")
            }.tag(0)
            ListView(colorUi: .systemPurple, baseColor: Color(UIColor.systemPurple), titleName: "Favoris", searchBarActiv: true, pickerSect: false)
                .tabItem{
                    Image(systemName: "heart.fill")
                    Text("Favoris")
            }.tag(1)
            ListView(colorUi: .systemOrange, baseColor: Color(UIColor.systemOrange), titleName: "Historique", searchBarActiv: true, pickerSect: false)
                .tabItem{
                    Image(systemName: "clock.fill")
                    Text("Historique")
            }.tag(2)
            Profil()
                .tabItem{
                    Image(systemName: "person.fill")
                    Text("Profil")
            }.tag(3)
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
