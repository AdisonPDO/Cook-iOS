//
//  Extension.swift
//  Clean
//
//  Created by Raphael Lebas on 08/05/2020.
//  Copyright © 2020 Raphael Lebas. All rights reserved.
//

import SwiftUI

extension Color {
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
}


extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
