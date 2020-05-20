//
//  cards.swift
//  Cook
//
//  Created by Raphael Lebas on 20/05/2020.
//  Copyright © 2020 Adison. All rights reserved.
//

import SwiftUI

struct cards: View {
   var body: some View {
        
        
        NavigationView{
            
            
            ZStack{
                
                Image("Orloff")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .blur(radius: 10)
                    .edgesIgnoringSafeArea(.bottom)
                
                VStack{
                    
                    Card()
                    
                }
            }.navigationBarTitle("Rôti Orloff", displayMode: .inline).navigationBarItems(trailing: Button(action:{
                
            }, label:{
                Image(systemName: "heart").accentColor(.white)
            })).labelsHidden()
            
            
        }
        .onAppear{
            let navigationBarAppearance = UINavigationBarAppearance()
            
            navigationBarAppearance.backgroundColor = .systemPink
            
            navigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            
            navigationBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            
            
            UINavigationBar.appearance().standardAppearance = navigationBarAppearance
            UINavigationBar.appearance().compactAppearance = navigationBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
            
            
        }
    }
}

struct cards_Previews: PreviewProvider {
    static var previews: some View {
        cards()
    }
}

struct Card: View {
    var colorborder = Color(UIColor.systemPink)
    
    let menus = ["Ingrédients", "Preparation"]
    @State private var index = 0
    private var ingredients = ["• Veau", "• Tomates", "• Tranches de Bacon", "• Tranches de Chedar"]
    private var preparations = ["• Couper le veau en deux", "• Placer une tranche de Bacon", "• Placer une tranche de Chedar", "• Placer une tranche de tomate", "• Placer une tranche de tomate", "• Placer une tranche de Fromage"]
    
    
    var body: some View {
        VStack{
            
            Image("Orloff")
                .resizable()
                .clipped()
                .frame(width: 300,height:200)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(30, corners: [.topLeft, .topRight])
            
            
            VStack(alignment: .center, spacing: 3){
                
                HStack(spacing: 40){
                    
                    Text("Temps")
                        .foregroundColor(.white)
                    Text("Portions")
                        .foregroundColor(.white)
                    Text("Calories")
                        .foregroundColor(.white)
                }
                
                HStack(spacing: 85){
                    Text("1h26")
                        .foregroundColor(.white)
                    Text("6")
                        .foregroundColor(.white)
                    Text("906")
                        .foregroundColor(.white)
                    
                }
                
                }
            .background(
                Rectangle()
                    .fill(colorborder)
                    .frame(width: 301, height: 130.0)
                    .clipShape(RoundedCorner(radius: 25.0, corners: [.topLeft, .topRight])))
            
            VStack{
                SegmentedControl(_index: $index, backgroundColor: .systemPink, textColor: .white, items: menus).frame(width: 15, height: 10)
                    .pickerStyle(SegmentedPickerStyle())
                
                VStack(alignment: .trailing, spacing: 10){
                    ScrollView{
                        if index == 0{
                            ForEach(ingredients, id: \.self) { ingredient  in
                                Text(ingredient).padding(.bottom)
                            }
                        } else {ForEach(preparations, id: \.self) { preparation in
                                Text(preparation).padding(.bottom)
                            }
                        }
                    }.padding()
                    
                }.frame(maxWidth: .infinity, maxHeight: 200)
            }
            .padding(30)
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color.offWhite)
                    .frame(maxWidth: 305, maxHeight:250)
                    
                    .clipShape(RoundedCorner(radius: 30.0, corners: [.topLeft, .topRight])).padding(.horizontal)
                , alignment: .top)
        }
        
    }
}
