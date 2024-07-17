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
    var isComplete = false
    
    init(name: String = "Step") {
        self.name = name
    }
}
