//
//  ApiPrint.swift
//  Cook
//
//  Created by Stephane Peyras on 25/05/2020.
//  Copyright © 2020 Adison. All rights reserved.
//

import SwiftUI

struct ScanneData {
    var status: Int
    var statusVerbose: String? = ""
    var code: String? = ""
}

struct ApiPrint: View {
    @State var barcodeValue = ""
        
        var body: some View {
            
            
                Text(barcodeValue)
            
        }
    }
struct ApiPrint_Previews: PreviewProvider {
    static var previews: some View {
        ApiPrint()
    }
}
