//
//  ToggleViewProfil.swift
//  Cook
//
//  Created by Adison on 15/05/2020.
//  Copyright © 2020 Adison. All rights reserved.
//

import SwiftUI

struct ToggleViewProfil: View {
    var pref : UserPref
    @State var butColor = Color(UIColor.systemRed)
    @Environment(\.managedObjectContext) var MOC
    var body: some View {
        VStack{
            Button(action: {
                self.pref.ban.toggle()
                do {
                    try self.MOC.save()
                } catch {
                    print(error)
                }
            }, label: {
                pref.ban ? Text("Retirer") : Text("Ajouter")
            })
        }
    }
}

//struct ToggleViewProfil_Previews: PreviewProvider {
//    static var previews: some View {
//        ToggleViewProfil()
//    }
//}
