//
//  Picker.swift
//  Clean
//
//  Created by Raphael Lebas on 12/05/2020.
//  Copyright © 2020 Raphael Lebas. All rights reserved.
//

import SwiftUI
import UIKit

final class SegmentedControl: UIViewRepresentable {
    internal init(_index: Binding<Int>, backgroundColor: UIColor = .systemPink, textColor: UIColor = .white, items : [String] = []) {
        self._index = _index
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.items = items
    }
    
  
    
    @Binding var index : Int
    var backgroundColor : UIColor = .systemPink
    var textColor : UIColor = .systemPink
    var items : [String]
    typealias UIViewType = UISegmentedControl
   
    
    func makeUIView(context: UIViewRepresentableContext<SegmentedControl>) -> UISegmentedControl {
    
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = index
        
        let frame = UIScreen.main.bounds
        segmentedControl.frame = CGRect(x: frame.minX + 10, y: frame.minY + 50,
                                        width: frame.width - 20, height: frame.height*0.7)
        
        // Style the Segmented Control
        segmentedControl.layer.cornerRadius = 5.0  // Don't let background bleed
        segmentedControl.backgroundColor = backgroundColor
        segmentedControl.tintColor = UIColor.systemPink
        segmentedControl.setTitleTextAttributes([.foregroundColor: backgroundColor], for: .selected)
        segmentedControl.setTitleTextAttributes([.foregroundColor: textColor], for: .normal)
         segmentedControl.setTitleTextAttributes([.foregroundColor: backgroundColor], for: .highlighted)

//        segmentedControl.selectedSegmentTintColor = UIColor.green
        
        
        return segmentedControl
    }
    func updateUIView(_ uiView: UISegmentedControl, context: UIViewRepresentableContext<SegmentedControl>) {
        
        // Add target action method
        uiView.addTarget(self, action: #selector(changeColor(sender:)), for: .valueChanged)
        
        
    }
    
    @objc func changeColor(sender: UISegmentedControl) {
        print("Change color handler is called.")
        print("Changing Color to ")
        self.index = sender.selectedSegmentIndex
        switch sender.selectedSegmentIndex {
        case 0:
            print("Ingrédients")
        case 1:
            
            print("Préparation")
        default:
            
            break
        }
    }
    
    
    
}

struct SegmentedControl_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedControl(_index: .constant(0))
    }
}
