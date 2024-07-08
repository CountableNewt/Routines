//
//  SampleRoutines.swift
//  Routines
//
//  Created by Sam Clemente on 7/1/24.
//

import Foundation
import SwiftUI

struct SampleRoutines {
    static var routines: [Routine] = [
        Routine(name: "Morning Routine", routineStartHour: 6, iconColor: SystemColors.yellow.rawValue, iconSymbol: "sun.horizon", steps: [
            Step(name: "Train"),
            Step(name: "Shower"),
            Step(name: "Brush Teeth"),
            Step(name: "Weigh-In")
        ]),
        Routine(name: "Evening Routine", routineStartHour: 21, iconColor: SystemColors.purple.rawValue, iconSymbol: "moon.zzz", steps: [
            Step(name: "Yoga"),
            Step(name: "Journal"),
            Step(name: "Meditation"),
            Step(name: "Put out Clothes for the Morning"),
            Step(name: "Brush Teeth"),
            Step(name: "Skincare Routine")
        ])
    ]
}
