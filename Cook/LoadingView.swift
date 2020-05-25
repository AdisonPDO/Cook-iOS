//
//  LoadingView.swift
//  Cook
//
//  Created by Stephane Peyras on 25/05/2020.
//  Copyright © 2020 Adison. All rights reserved.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        
        ZStack {
            Color.white
                .frame(width: 120, height: 120)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .shadow(color: Color.black.opacity(0.2), radius: 30, x: 0, y: 30)
            LottieView()
                
                .frame(width: 100, height: 100)
        }
        }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
