//
//  ModalScanner.swift
//  Cook
//
//  Created by Stephane Peyras on 25/05/2020.
//  Copyright © 2020 Adison. All rights reserved.
//

import SwiftUI

import Foundation

struct Product: Codable ,Hashable{
    var name: String?
//    var imageSmallUrl: URL
    var numb: String?
    
    enum CodingKeys : String, CodingKey {
        case name = "product_name"
//        case imageSmallUrl = "image_small_url"
        case numb = "quantity"
    }
}

struct Response: Codable{
    var status: Int
    var statusVerbose: String
    var code: String
    var product: Product
    
    enum CodingKeys : String, CodingKey {
        case statusVerbose = "status_verbose"
        case status, code, product
    }
}

//var products = [Product]()

struct ModalScannerView: View {
    
    @Binding var products : [Product]
    @State var code = ""
    
    
    var body: some View {
        
        VStack{
            Spacer()
            Text("Scannez vos ingrédients")
            
            
            Spacer()
 
            CBScanner(supportBarcode: [.qr,
                    .code128,
                    .code39,
                    .code39Mod43,
                    .code93,
                    .ean13,
                    .ean8,
                    .interleaved2of5,
                    .itf14,
                    .pdf417,
                    .upce
            ])
            .interval(delay: 1.0)
            .found{
                print($0)
                self.code = $0
                self.load()
            }
           .simulator(mockBarCode: "Barcode Sauce Tomate")
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 400, maxHeight: 400, alignment: .topLeading)
            
           Spacer()
            
           Text(code)
//            for product in products
//            {Text(product.name)
//            List(products, id: \.self) { product in
//                Text("\(product.name ?? "")")
//          }
       
        }
    }
    func load() {
        guard let url = URL(string: "https://world.openfoodfacts.org/api/v0/product/\(code).json") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode(Response.self, from: data)
                    DispatchQueue.main.async {
                        //1 = product found
                        if Int(decodedResponse.status) == 1 {
                            
                            self.products.append(decodedResponse.product)
                            
                            
                            for product in self.products {
                                print("\(product.name ?? "aucun nom")\(product.numb ?? "aucun nom")")
                            }
                            print("fin tableau==")
                        }
        
                    }
                }catch{
                    print(error)
                }
            }
            if let error = error {
                print(error)
            }
        }
        .resume()
    }

  
}

struct ModalScannerView_Previews: PreviewProvider {
    static var previews: some View {
        ModalScannerView(products: .constant([Product]()))
    }
}
