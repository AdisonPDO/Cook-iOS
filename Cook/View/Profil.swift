//
//  Profil.swift
//  Cook
//
//  Created by Adison on 13/05/2020.
//  Copyright © 2020 Adison. All rights reserved.
//

import SwiftUI

struct pref {
    var id = UUID()
    var pref : String
    @State var not : Bool
}
var tablePref = [ pref(pref: "sucre", not: true), pref(pref: "gluten", not: false), pref(pref: "sel", not: true)]

struct Profil: View {
    var baseColor : Color
    var baseColorUi : UIColor
    var titleName : String
    @State var banPref = 0
    @State var addPref = ""
    @State var isShowingAlert = false
    
    
    
    init(colorUi : UIColor, baseColor : Color, titleName : String) {
        self.baseColor = baseColor
        self.titleName = titleName
        self.baseColorUi = colorUi
        
        
        let navigationBarAppearance = UINavigationBarAppearance()
        
        
        navigationBarAppearance.backgroundColor = colorUi
        
        navigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white, .font : UIFont.systemFont(ofSize: 30.0)]
        
        navigationBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
    }
    var body: some View {
        NavigationView{
            
            VStack {
                VStack(alignment : .leading) {
                    Text("Intolérances/Allergies")
                        .fontWeight(.light)
                        .foregroundColor(Color.pink)
                        .font(.title)
                    
                    
                    ForEach(tablePref, id: \.id){ pref in
                        VStack{
                            Toggle(isOn: pref.$not){
                                Text(pref.pref)
                            }
                            Divider()
                        }
                        
                    }
                    Text("Autres intolérances")
                        .fontWeight(.light)
                        .foregroundColor(.pink)
                        .font(.title)
                    HStack{
                        TextField("Entrez un element", text: $addPref)
                        Button(action : {
                            if self.addPref.isEmpty {
                                self.isShowingAlert.toggle()
                            } else {
                                let newPref = pref(pref: self.addPref, not: true)
                                tablePref.append(newPref)
                                self.addPref = ""
                            }
                            
                        }, label: {Text("Ajouter")}).alert(isPresented: $isShowingAlert){
                            Alert(title: Text("Champ vide"), message: Text("Veuillez entrez un ingrédient"), dismissButton: .default(Text("Ok")))
                        }
                    }
                    Divider()


                        
                        .navigationBarTitle(Text("\(titleName)").font(.title), displayMode: .inline)
                }.padding()
                Picker(selection: $banPref, label: Text("")){
                    ForEach(0..<vegetablePref.count){
                        
                        Text(vegetablePref[$0]).tag($0)
                            .onTapGesture {
                                let newPref = pref(pref: vegetablePref[0], not: true)
                                tablePref.append(newPref)
                        }
                        
                    }
                }.labelsHidden()
                Spacer()
            }
            
        }        .onAppear{
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

struct Profil_Previews: PreviewProvider {
    static var previews: some View {
        Profil(colorUi: UIColor.systemPink, baseColor: Color(UIColor.systemPink), titleName: "Profil")
    }
}
