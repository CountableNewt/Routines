//
//  Step.swift
//  Routines
//
//  Created by Sam Clemente on 6/30/24.
//
import Foundation
import SwiftData

    
@Model
class Step: Identifiable {
    var id = UUID()
    var name: String
    var order: Int
    var routine: Routine
    var status = StepCompletionStatus.incomplete
    var days: [String] = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    
    init(name: String = "Step", routine: Routine, order: Int) {
        self.name = name
        self.routine = routine
        self.order = order
    }
}
