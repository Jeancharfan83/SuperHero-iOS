//
//  UIColor.swift
//  SuperHero-iOS
//
//  Created by Tardes on 20/12/24.
//

import UIKit

extension UIColor {
    // Método para crear un color a partir de un valor hexadecimal
    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        // Si el código hexadecimal tiene un "#" al principio, lo quitamos
        if hexSanitized.hasPrefix("#") {
            hexSanitized.remove(at: hexSanitized.startIndex)
        }
        
        // Definir valores RGB
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        
        // Inicializar el color
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
