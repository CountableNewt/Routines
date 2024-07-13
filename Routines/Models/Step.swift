//
//  Item.swift
//  Routines
//
//  Created by Sam Clemente on 6/30/24.
//
import Foundation
import SwiftData

@Model
class Step {
    var name: String
    var isComplete = false
    
    init(name: String = "Step") {
        self.name = name
    }
}
