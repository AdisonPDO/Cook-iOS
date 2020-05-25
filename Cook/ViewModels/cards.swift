//
//  cards.swift
//  Cook
//
//  Created by Raphael Lebas on 20/05/2020.
//  Copyright © 2020 Adison. All rights reserved.
//

import SwiftUI


struct cards: View {
    let recipetype: recipeType
    
    
    var body: some View {
        
        
        
        
        
        ZStack{
            
            Image(recipetype.pic)
                .resizable()
                .scaledToFill()
                .clipped()
                .blur(radius: 10)
                .edgesIgnoringSafeArea(.bottom)
            
            VStack{

                Card(recipetype: recipetype)

            }
            
        }
            
            //  }
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
        cards(recipetype: recipeList[0])
    }
}

struct Card: View {
    @State var colorborder = Color(UIColor.systemPink)
    @State var menus = ["Ingrédients", "Preparation"]
    @State private var index = 0
    @State var likes = false

    let recipetype: recipeType


    var body: some View {
        VStack{

            Image(String(recipetype.pic))
                .resizable()
                .clipped()
                .frame(width: 300,height:200)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(30, corners: [.topLeft, .topRight])


            VStack(alignment: .center, spacing: 3){

                HStack(spacing: 10){


                    VStack{
                        Text("Temps")
                            .foregroundColor(.white)
                        Text(self.recipetype.time)
                            .foregroundColor(.white)

                    }
                    VStack{
                        Text("Portions")
                            .foregroundColor(.white)
                        Text(self.recipetype.part)
                            .foregroundColor(.white)

                    }
                    VStack{
                        Text("Calories")
                            .foregroundColor(.white)
                        Text(self.recipetype.calories)
                            .foregroundColor(.white)
                    }
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
                            ForEach(recipetype.ingredients.indices, id: \.self) { ingredient  in

                                Text("\(String(format: "%.2f",Double   (self.recipetype.ingredients[ingredient].content ?? 0)))\(self.recipetype.ingredients[ingredient].measured ?? "") \(self.recipetype.ingredients[ingredient].name)").padding(.bottom)
                            }
                        } else {ForEach(recipetype.recipeSteps.indices, id: \.self) { preparation in
                            Text(self.recipetype.recipeSteps[preparation]).padding(.bottom)
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


        }.navigationBarTitle(Text(recipetype.name), displayMode: .inline)
                .navigationBarItems(trailing: Button(action:{
        
                }, label:{
                    Image(systemName: likes ? "heart.fill" : "heart")
                        .resizable()
                        .frame(minWidth: 20, idealWidth: 20, maxWidth: 20, minHeight: 20, idealHeight: 20, maxHeight: 20)
                            .padding()
                            .foregroundColor(.white)
        
                    })).labelsHidden()
        
        
    }
}
