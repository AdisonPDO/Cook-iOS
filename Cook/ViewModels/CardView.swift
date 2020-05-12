//
//  CardView.swift
//  MyAppCook
//
//  Created by Adison on 07/05/2020.
//  Copyright © 2020 Adison. All rights reserved.
//
import SwiftUI

struct CardView: View {
    //var recipMinPic = Image()
    var recipeName : String
    var like : Bool
    var bordColor : Color
    var recipePic : String?
    
    var body: some View {
        ZStack{
            Image(String(recipePic ?? "default")).resizable()
                .frame(width: 150.0, height: 150.0)
            .cornerRadius(25)
                .overlay(
                    ZStack{
                        Rectangle()
                            .fill(bordColor)
                            .frame(width: 150.0, height: 45.0)
                            .clipShape(RoundedCorner(radius: 25.0, corners: [.bottomLeft, .bottomRight]))
                        Text(recipeName)
                            .foregroundColor(.white)
                    }
                    , alignment: .bottom)
                .overlay(
                    
                    Image(systemName: like ? "heart.fill" : "heart")
                        .padding()
                        .foregroundColor(.red)
                    , alignment: .topTrailing)
            
            
            
        }
    .padding()
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(recipeName: "toto", like: false, bordColor: Color(UIColor.systemRed))
    }
}
