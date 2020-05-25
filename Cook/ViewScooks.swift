//
//  ViewScooks.swift
//  Cook
//
//  Created by Stephane Peyras on 25/05/2020.
//  Copyright © 2020 Adison. All rights reserved.
//

import SwiftUI
import SwiftUI

struct ScanData {
    public var name: String? = ""
    public var numb: String? = ""
    public var valid: Bool = false
}

struct ViewScooks: View {
 
        

        
            @State var showCarousel = false
            @State var showScan = false
            @State private var scanData = ScanData()
            @State var products = [Product]()
            var body: some View {
                    
                NavigationView {
                    VStack {
                        
                    
                        Button(action: {
                            self.showScan.toggle()
                        }, label: {
                            LoadingView()
                            
                        })
                        .sheet(isPresented: $showScan, content: {
                            //                    Text("Scannez vos ingrédients")
                            ModalScannerView(products: self.$products)
                        })
                        
                        Spacer()
                        
        //               List(products, id: \.self) { product in
        //                        Text("\(product.name ?? "")")
        //                  }
                        
                        
                        
                    }
                    .navigationBarTitle("Les Listes")
                    .frame(alignment : .center)
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
                    
                   
                    
                }
                
            }


struct ViewScooks_Previews: PreviewProvider {
    static var previews: some View {
        ViewScooks()
    }
}
