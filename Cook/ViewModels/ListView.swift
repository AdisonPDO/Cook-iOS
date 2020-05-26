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




struct ListView: View {
    var baseColor : Color
    var baseColorUi : UIColor
    var titleName : String
    var searchBarActiv : Bool
    var pickerSect : Bool
    @State var segInt = 1
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
    
//    @State private var Results = [Result]()
    @State var search = ""
    @State var segSearch = "Pomm"
    @State var showCarousel = false
    @State var showScan = false
   
    var body: some View {
        
        return NavigationView{
            VStack{
                if searchBarActiv {
                    SearchBar(text: $search)
                    ForEach(recipeList.filter({self.search.isEmpty ? true :  $0.name.contains(self.search)}).chunked(into: 2), id: \.self) { recipeChunk in
                        self.cardGenerate(recipeChunk: recipeChunk)
                    }
                } else {
                    if self.pickerSect{
                        Picker(selection: self.$segInt, label: Text("")){
                            Text("Ingrédients").tag(0)
                            Text("Recettes").tag(1)
                        }.frame(width: 300.0).pickerStyle(SegmentedPickerStyle())
                            .padding()
                    }
                    if segInt == 1 {
                        ForEach(recipeList.filter({ self.segSearch.isEmpty ? true : $0.ingredients.map{$0.name}.contains{$0.lowercased().hasPrefix(self.segSearch.lowercased())}}).chunked(into: 2), id: \.self){ recipeChunk in
                            self.cardGenerate(recipeChunk: recipeChunk)
                            
                        }
                        
                    } else {
                        ViewScooks()
                    }
                }
                
                
                Spacer()
                
                
            }
            .navigationBarTitle(Text(titleName).font(.title), displayMode: .inline)
                               .navigationBarItems(trailing:
                                   HStack {
                                       Button(action: {
                       //                self.showOrderSheet = true
                                   }, label: {
                                       Image(systemName: "plus.circle")
                                           .resizable()
                                           .frame(width: 32, height: 32, alignment: .center)
                                       })
                                       Button(action: {
                                                       self.showCarousel = true
                                                   }, label: {
                                                       Image(systemName: "info.circle")
                                                           .resizable()
                                                           .frame(width: 32, height: 32, alignment: .center)
                                                       })
                                       .sheet(isPresented: $showCarousel, content: {
                                            //                    Text("Scannez vos ingrédients")
                                             Carousel()
                                       })
                               }
                               )
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
    
    func cardGenerate(recipeChunk : [recipeType]) -> some View{
        return  HStack{
            ForEach(recipeChunk, id: \.self) {
                recipe in
                CardView(recipeName: recipe.name, like: false, bordColor: self.baseColor, recipePic: recipe.pic)
                
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(colorUi: .systemPink, baseColor: Color(UIColor.systemPink), titleName: "Recettes", searchBarActiv: false, pickerSect: false)
    }
}
