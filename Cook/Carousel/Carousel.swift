//
//  Carousel.swift
//  Cook
//
//  Created by Stephane Peyras on 25/05/2020.
//  Copyright © 2020 Adison. All rights reserved.
//

import SwiftUI

extension Font {
    static func avenirNext(size: Int) -> Font {
        return Font.custom("Avenir Next", size: CGFloat(size))
    }
    
    static func avenirNextRegular(size: Int) -> Font {
        return Font.custom("AvenirNext-Regular", size: CGFloat(size))
    }
}

struct Carousel: View {
    var body: some View {
        ScrollView {
            
            GeometryReader { geometry in
                ImageCarouselView(numberOfImages: 3) {
                    ZStack {
                        Color.pink
                        VStack (alignment: .center) {
                            
                            Spacer()
                            Image("default")
                                .clipShape(Circle())
                                .overlay(
                                    Circle().stroke(Color.orange,lineWidth: 10))
                                .shadow(radius: 10)
                            
                            Text("Bienvenue !")
                                .font(Font.custom("Noteworthy", size: 35))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Spacer()
                            Text("Scooks est une appli qui vous aide à choisir les bons plats en fonction de vos préférences.")
                               .multilineTextAlignment(.center)
                                .font(.title)
                                .padding(.horizontal)
                                .foregroundColor(.white)
                            Spacer()
                            HStack {
                                Image(systemName: "house.fill")
                                    .padding(.horizontal)
                                    .font(.title)
                                Image(systemName: "circle.fill")
                                    .padding(.horizontal)
                                    .font(.title)
                                Image(systemName: "circle.fill")
                                    .padding(.horizontal)
                                    
                                    .font(.title)
                                
                            }
                            .foregroundColor(.orange)
                            .padding()
                            Spacer()
                            
                            
                        }
                            
                            
                            
                            
                        .frame(width: geometry.size.width, height:geometry.size.height)
                        .clipped()
                        
                    }
                    ZStack {
                        Color.orange
                        VStack (alignment: .center) {
                            
                            Spacer()
                            Image("gratin")
                                .clipShape(Circle())
                                .overlay(
                                    Circle().stroke(Color.pink,lineWidth: 10))
                                .shadow(radius: 10)
                            
                            Text("Analyse des plats !")
                                .font(Font.custom("Noteworthy", size: 35))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Spacer()
                            Text("Scooks scanne vos produits et vous propose des plats adaptés en fonction de vos préférences.")
                                .multilineTextAlignment(.center)
                                .font(.title)
                                .padding(.horizontal)
                                .foregroundColor(.white)
                            Spacer()
                            HStack {
                                Image(systemName: "circle.fill")
                                    .padding(.horizontal)
                                    .font(.title)
                                Image(systemName: "magnifyingglass")
                                    .padding(.horizontal)
                                    .font(.title)
                                Image(systemName: "circle.fill")
                                    .padding(.horizontal)
                                    
                                    .font(.title)
                                
                            }
                            .foregroundColor(.pink)
                            .padding()
                            Spacer()
                            
                            
                        }
                            
                            
                            
                            
                        .frame(width: geometry.size.width, height:geometry.size.height)
                        .clipped()
                        
                    }
                    ZStack {
                        Color.purple
                        VStack () {
                            
                            Spacer()
                            Image("saucisse")
                                .clipShape(Circle())
                                .overlay(
                                    Circle().stroke(Color.orange,lineWidth: 10))
                                .shadow(radius: 10)
                            
                            Text("Recommandations")
                                .font(Font.custom("Noteworthy", size: 35))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            Spacer()
                            Text("Scooks vous recommande de meilleures alternatives.\n\n C'est parti")
                                .multilineTextAlignment(.center)
                                
                                //                        .frame(width: 350)
                                .font(.title)
                                .padding(.horizontal)
                                .foregroundColor(.white)
                            Spacer()
                            HStack {
                                Image(systemName: "circle.fill")
                                    .padding(.horizontal)
                                    .font(.title)
                                Image(systemName: "circle.fill")
                                    .padding(.horizontal)
                                    .font(.title)
                                Image(systemName: "hand.thumbsup.fill")
                                    .padding(.horizontal)
                                    
                                    .font(.title)
                                
                            }
                            .foregroundColor(.orange)
                            .padding()
                            Spacer()
                            
                            
                        }
                            
                            
                            
                            
                        .frame(width: geometry.size.width, height:geometry.size.height)
                        .clipped()
                    }
                }
            }.frame(height : 855 )
       
            
            
            
        }
    }
}

struct Carousel_Previews: PreviewProvider {
    static var previews: some View {
        Carousel()
    }
}

