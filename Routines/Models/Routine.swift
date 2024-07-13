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
class Routine {
    var name: String
    var startHour: Int
    var startMinute: Int
    var iconColor: String
    var iconSymbol: String
    @Relationship(deleteRule: .cascade) var steps = [Step]()
    
    init(name: String = "New Routine", startHour: Int = 0, startMinute: Int = 0, iconColor: String = SystemColors.blue.rawValue, iconSymbol: String = "list.bullet") {
        self.name = name
        self.startHour = startHour
        self.startMinute = startMinute
        self.iconColor = iconColor
        self.iconSymbol = iconSymbol
    }
    
    // This is really only used for SampleRoutines to add steps at initialization
    // This currently isn't how the user flow will actually work, routines are created with empty steps arrays, then the steps are added later
    // I will work on making the user flow smoother in later iterations of the app
    init(name: String = "New Routine", startHour: Int = 0, startMinute: Int = 0, iconColor: String = SystemColors.blue.rawValue, iconSymbol: String = "list.bullet", steps: [Step] = [Step]()) {
        self.name = name
        self.startHour = startHour
        self.startMinute = startMinute
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
    
    func getTime() -> DateComponents {
        return DateComponents(hour: self.startHour, minute: self.startMinute)
    }
}
