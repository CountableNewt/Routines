//
//  Routine.swift
//  Routines
//
//  Created by Sam Clemente on 6/30/24.
//
import Foundation
import SwiftData
import SwiftUI

@Model
final class Routine: Identifiable {
    var id = UUID()
    var name: String
    var routineStartHour: Int
    var routineStartMinute: Int
    var iconColor: String
    var iconSymbol: String
    var steps: [Step]
    
    init(name: String = "New Routine", routineStartHour: Int = 0, routineStartMinute: Int = 0, iconColor: String = SystemColors.blue.rawValue, iconSymbol: String = "list.bullet" , steps: [Step] = []) {
        self.name = name
        self.routineStartHour = routineStartHour
        self.routineStartMinute = routineStartMinute
        self.iconColor = iconColor
        self.iconSymbol = iconSymbol
        self.steps = steps
    }
    
    func getIconColor() -> Color {
        switch self.iconColor {
        case ".red":
            return Color.red
        case ".orange":
            return Color.orange
        case ".yellow":
            return Color.yellow
        case ".green":
            return Color.green
        case ".mint":
            return Color.mint
        case ".teal":
            return Color.teal
        case ".cyan":
            return Color.cyan
        case ".blue":
            return Color.blue
        case ".indigo":
            return Color.indigo
        case ".purple":
            return Color.purple
        case ".pink":
            return Color.pink
        case ".brown":
            return Color.brown
        default:
            return Color.blue
        }
    }
}
