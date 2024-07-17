//
//  IconLists.swift
//  Routines
//
//  Created by Sam Clemente on 7/16/24.
//

import Foundation

enum IconLists: String, CaseIterable, Identifiable {
    case timeOfDay = "Time of Day"
    case lists = "Lists"
    
    var id: IconLists { self }
    
    var iconList: [String] {
        switch self {
        case .timeOfDay:
            return ["sunrise", "sunset", "sun.horizon", "moon", "moon.stars", "hourglass"]
        case .lists:
            return ["list.bullet", "list.dash", "list.triangle", "list.number", "list.star", "list.clipboard", "list.bullet.clipboard", "list.bullet.rectangle", "list.bullet.indent", "checklist.unchecked", "checklist", "checklist.checked"]
        }
    }
}
