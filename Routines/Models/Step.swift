//
//  Item.swift
//  Routines
//
//  Created by Sam Clemente on 6/30/24.
//

import Foundation
import SwiftData

@Model
final class Step {
    var timestamp: Date
    var name: String
    var isComplete: Bool
    
    init(timestamp: Date, name: String, isComplete: Bool) {
        self.timestamp = timestamp
        self.name = name
        self.isComplete = isComplete
    }
}
