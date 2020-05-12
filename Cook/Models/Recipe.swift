//
//  Recipe.swift
//  MyAppCook
//
//  Created by Adison on 11/05/2020.
//  Copyright © 2020 Adison. All rights reserved.
//
import SwiftUI

struct ingredientsType : Identifiable {
    var id = UUID()
    var name : String
    var measured : String?
    var content : Double?
}

struct recipeType : Identifiable{
    var id = UUID()
    var name : String
    var ingredients = [ingredientsType]()
    var recipeSteps = [String]()
    var time : String
    var part : String
    var calories : String
    var pic : String
}


var recipeList = [[
    recipeType(name: "Gratin", ingredients: [
        ingredientsType(name: "Pommes de terre", measured: "Kg", content: 1.5),
        ingredientsType(name: "Gousses d'ail", measured: "", content: 2),
        ingredientsType(name: "Crème", measured: "cl", content: 30),
        ingredientsType(name: "Beure", measured: "g", content: 100),
        ingredientsType(name: "Lait", measured: "l", content: 1),
        ingredientsType(name: "Muscade"),
        ingredientsType(name: "Sel"),
        ingredientsType(name: "Poivre")
        ], recipeSteps: [
            "Eplucher, laver et couper les pommes de terre en rondelles fines (NB : ne pas les laver APRES les avoir coupées, car l'amidon est nécessaire à une consistance correcte).",
            "Hacher l'ail très finement.",
            "Porter à ébullition dans une casserole le lait, l'ail, le sel, le poivre et la muscade puis y plonger les pommes de terre et laisser cuire 10 à 15 min, selon leur fermeté.",
            "Préchauffer le four à 180°C (thermostat 6) et beurrer un plat à gratin.",
            "Placer les pommes de terre égouttées dans le plat. Les recouvrir de crème, puis disposer des petites noix de beurre sur le dessus.",
            "Enfourner pour 50 min à 1 heure de cuisson."
    ], time: "1h25",part: "6", calories: "132cal-100g", pic: "gratin"),
    recipeType(name: "Saucisses aux lentilles", ingredients: [
        ingredientsType(name: "Lentilles vertes", measured: "g", content: 250),
        ingredientsType(name: "Saucisses", content: 4),
        ingredientsType(name: "Oignons blanc"),
        ingredientsType(name: "Carotte", content: 1),
        ingredientsType(name: "Lardons fumés", measured: "g", content: 100),
        ingredientsType(name: "Bouquet garni", content: 1)], recipeSteps: [
            "Piquer les saucisses avec une fourchette.",
            "Après mettez-les dans 1,5 litre d'eau froide, avec le bouquet garni et la carotte coupée en rondelles. Faites cuire à gros bouillons pendant 15 à 20 min.",
            "Pendant ce temps, faites revenir les lardons dans une poêle, juste pour qu'ils soient légèrement dorés et croquants.",
            "Ajoutez les lardons, les oignons blancs et les lentilles dans le faitout des saucisses. Ne salez pas, les lardons le feront.",
            "Couvrez et faites cuire le tout à feu doux de 20 à 25 min.",
            "Égouttez, retirez le bouquet garni, disposez sur un plat avec un peu de persil haché et servez aussitôt."],
                                                             time: "55 min", part: "4", calories: "168cal - 100g", pic : "saucisse")
]]
