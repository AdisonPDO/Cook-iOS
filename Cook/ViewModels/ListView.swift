//
//  ListView.swift
//  MyAppCook
//
//  Created by Adison on 30/04/2020.
//  Copyright © 2020 Adison. All rights reserved.
//
import SwiftUI

//.resizable().scaledToFill() = photo full screen
// link api : https://www.wecook.fr/recipe/web-api/v2/recipes/search

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct Response : Codable {
    var rersults : [Result]
}
struct Result : Codable {
    var calories : Int
    var platNom : String
    var pic : URL
}



struct ListView: View {
    var baseColor : Color
    var baseColorUi : UIColor
    var titleName : String
    var searchBarActiv : Bool
    var pickerSect : Bool
    init(colorUi : UIColor, baseColor : Color, titleName : String, searchBarActiv : Bool, pickerSect : Bool) {
        self.baseColor = baseColor
        self.titleName = titleName
        self.searchBarActiv = searchBarActiv
        self.baseColorUi = colorUi
        self.pickerSect = pickerSect
           
            let navigationBarAppearance = UINavigationBarAppearance()

        
        navigationBarAppearance.backgroundColor = colorUi
            
        navigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white, .font : UIFont.systemFont(ofSize: 30.0)]
          
            navigationBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

            
            UINavigationBar.appearance().standardAppearance = navigationBarAppearance
            UINavigationBar.appearance().compactAppearance = navigationBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
    }
            
    @State private var Results = [Result]()
    @State var segInt = 1
    @State var search = ""
    var body: some View {
        NavigationView{
        VStack{
            if searchBarActiv {
                SearchBar(text: $search)
            }
       
            if pickerSect{
                Picker(selection: $segInt, label: Text("")){
                    Text("Ingrédients").tag(0)
                    Text("Recettes").tag(1)
                }.frame(width: 300.0).pickerStyle(SegmentedPickerStyle())
                    .padding()
            }

            ForEach(0..<recipeList.count) {index  in
                HStack{
                    CardView(recipeName: recipeList[index][0].name, like: false, bordColor: self.baseColor, recipePic: recipeList[index][0].pic)
                    CardView(recipeName: recipeList[index][1].name, like: true, bordColor: self.baseColor, recipePic: recipeList[index][1].pic )
                }
                
                
            }
            Spacer()
            
            
        }
        .navigationBarTitle(Text(titleName).font(.title), displayMode: .inline)
        }
        .onAppear{
            let navigationBarAppearance = UINavigationBarAppearance()

                   
            navigationBarAppearance.backgroundColor = self.baseColorUi
                       
                   navigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white, .font : UIFont.systemFont(ofSize: 30.0)]
                     
                       navigationBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

                       
                       UINavigationBar.appearance().standardAppearance = navigationBarAppearance
                       UINavigationBar.appearance().compactAppearance = navigationBarAppearance
                       UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(colorUi: .systemPink, baseColor: Color(UIColor.systemPink), titleName: "Recettes", searchBarActiv: false, pickerSect: false)
    }
}
