//
//  Profil.swift
//  Cook
//
//  Created by Adison on 13/05/2020.
//  Copyright © 2020 Adison. All rights reserved.
//

import SwiftUI

struct Profil: View {
    
    @State private var searchIntolerance = ""
    @State private var showCancelButton: Bool = false
    @State private var toggle1 = true
    @State private var toggle2 = true
    @State private var toggle3 = true
    @State private var bansearch:  String = ""
    @State private var banfood = 0
    @State private var intolerances = [String] ()
    
    
    var body: some View {
        
        NavigationView {
            
            VStack(spacing: 20) {
                IntoleranceView(toogle1: $toggle1, toogle2: $toggle2, toogle3: $toggle3)
                VStack(alignment: .leading,spacing: 15){
                    
                    Text("Intolérances/Allergies")
                        .fontWeight(.light)
                        .foregroundColor(.pink)
                        .font(.title)
                    
                                VStack {
                                    HStack {
                                        HStack {
                                            TextField ("Search", text: $searchIntolerance, onEditingChanged: { isEditing in self.showCancelButton = true
                                            }, onCommit : {
                                                print("onCommit")
                                            }).foregroundColor(.primary)
                                            Button(action: { self.searchIntolerance = ""
                                            }) {
                                                Image(systemName: "xmark.circle.fill").opacity(searchIntolerance == "" ? 0 : 1)
                                            }
                                        }
                                        .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                                        .foregroundColor(.secondary)
                                        .background(Color(.secondarySystemBackground))
                                        .cornerRadius(10.0)
                                        
                                        if showCancelButton {
                                            Button("Cancel"){
                                                UIApplication.shared.endEditing(true)
                                                self.searchIntolerance = ""
                                                self.showCancelButton = false
                                            }
                                            .foregroundColor(Color(.systemBlue))
                                        }
                                    }
                                    .padding(.horizontal)
                                .navigationBarHidden(showCancelButton)
                                    
                                    List {
                                        ForEach(vegetablePref.filter{$0.hasPrefix(searchIntolerance) || searchIntolerance == ""}, id:\.self) {
                                            searchText in Button(action: {
                                                self.searchIntolerance = searchText
                                                if self.searchIntolerance == searchText{
                                                    self.intolerances.append(searchText)
                                                }
                                            }, label: {Text(searchText)})
                                        }
                                    }
                                .navigationBarTitle(Text(""))
                                .resignKeyboardOnDragGesture()
                                    
                                    ForEach(intolerances, id: \.self){
                                        intolerance in Text(intolerance)
                                    }
                                }
                            }.navigationBarTitle(Text("Profil"))
                        }
                    }
            }
    
            struct IntoleranceView: View {
                @Binding var toogle1 : Bool
                @Binding var toogle2 : Bool
                @Binding var toogle3 : Bool
                var body: some View {
                    VStack(alignment: .leading) {
                        
                        
                        Text("Aliments bannis")
                            .fontWeight(.light)
                            .foregroundColor(Color.pink)
                            .font(.title)
                        
                        
                        Toggle(isOn: $toogle1) {
                            Text("Sucre")}
                        Divider()
                        
                        Toggle(isOn: $toogle2) {
                            Text("Glucose")}
                        Divider()
                        
                        Toggle(isOn: $toogle3) {
                            Text("Lactose")}
                        Divider()
                        
                        
                        
                    }.navigationBarTitle(Text("Profil"))
                }
            }

            
            
            
        }



struct Profil_Previews: PreviewProvider {
    static var previews: some View {
        Group {
        Profil()
            .environment(\.colorScheme,.light)
            
        Profil()
            .environment(\.colorScheme,.dark)
        }
    }
}

extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter{$0.isKeyWindow}
        .first?
        .endEditing(force)
    }
}

struct ResignKeyboardOnDragGesture: ViewModifier {
    var gesture = DragGesture().onChanged{_ in
        UIApplication.shared.endEditing(true)
    }
    func body(content: Content) -> some View {
        content.gesture(gesture)
}
}

extension View {
    func resignKeyboardOnDragGesture() -> some View {
        return modifier(ResignKeyboardOnDragGesture())
    }
}


