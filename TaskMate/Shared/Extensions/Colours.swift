//
//  Colours.swift
//  TaskMate
//
//  Created by Swapna Botta on 15/06/26.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        default: (a, r, g, b) = (1, 1, 1, 1)
        }
        self.init(.sRGB, red: Double(r) / 255, green: Double(g) / 255, blue: Double(b) / 255, opacity: Double(a) / 255)
    }
}


extension Color {

    // Main brand color
     static let taskPrimary = Color(hex: "#7C3AED")
     
     // Screen background
    
    static let taskButtonColour = Color(hex: "#665191")//F5F3FF,

    static let taskTitleColour = Color(hex: "006D77")//F5F3FF,
    
    static let taskFieldsColour = Color("fieldsColour")//F5F3FF,
    
    static let taskBackgroundColour = Color("taskBackground")//F5F3FF,


     
     // Cards
     static let taskCard = Color.white
     
     // Main text
     static let taskTextPrimary = Color(hex: "#1E1B4B")
     
     // Secondary text
     static let taskTextSecondary = Color(hex: "#6D6A8D")
     
     // Accent / highlights
     static let taskAccent = Color(hex: "#A78BFA")
}


extension Date {
    
        func convertedDate() -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MMM-yyyy hh:mm a"
            return dateFormatter.string(from: self) 
        }
        
}
