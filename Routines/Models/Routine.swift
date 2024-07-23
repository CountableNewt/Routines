//
//  Routine.swift
//  Routines
//
//  Created by Sam Clemente on 6/30/24.
//
import Foundation
import SwiftData
import SwiftUI
import UserNotifications

@Model
class Routine: Identifiable {
    var id = UUID()
    var name: String
    var time: Date
    var iconColor: String
    var iconSymbol: String
    @Relationship(deleteRule: .cascade) var steps = [Step]()
    
    init(name: String = "New Routine", time: Date = Date(), iconColor: String = SystemColors.blue.rawValue, iconSymbol: String = "list.bullet") {
        self.name = name
        self.time = time
        self.iconColor = iconColor
        self.iconSymbol = iconSymbol
    }

    init(name: String = "New Routine", time: Date = Date(), iconColor: String = SystemColors.blue.rawValue, iconSymbol: String = "list.bullet", steps: [Step] = [Step]()) {
        self.name = name
        self.time = time
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
    
    func timeToString() -> String {
        let time = self.time
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        return dateFormatter.string(from: time)
    }
    
    func copy() -> Routine {
        let copy = Routine(name: self.name, time: self.time, iconColor: self.iconColor, iconSymbol: self.iconSymbol)
        return copy
    }
    
    func resetSteps() {
        for step in steps {
            step.isComplete = false
        }
        
        let content = UNMutableNotificationContent()
        content.title = "Routine Reset"
        content.body = "\(self.name) has been reset. Let's get started!"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
}
