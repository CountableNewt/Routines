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
final class Routine {
    var timestamp: Date
    var name: String
    var routineTime: Date
    var iconColor: Color
    var iconSymbol: String
    var steps: [Step]
    
    init(timestamp: Date, name: String, routineTime: Date, iconColor: Color, iconSymbol: String, steps: [Step] = []) {
        self.timestamp = timestamp
        self.name = name
        self.routineTime = routineTime
        self.iconColor = iconColor
        self.iconSymbol = iconSymbol
        self.steps = steps
    }
}
