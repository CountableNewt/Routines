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
    @Attribute(.transformable(by: UIColorValueTransformer.self)) var iconColor: UIColor?
    var iconSymbol: String
    var steps: [Step]
    
    init(name: String = "New Routine", routineStartHour: Int = 0, routineStartMinute: Int = 0, iconColor: UIColor = .systemBlue, iconSymbol: String = "list.bullet" , steps: [Step] = []) {
        self.name = name
        self.routineStartHour = routineStartHour
        self.routineStartMinute = routineStartMinute
        self.iconColor = iconColor
        self.iconSymbol = iconSymbol
        self.steps = steps
    }
}
