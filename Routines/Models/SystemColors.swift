//
//  SystemColors.swift
//  Routines
//
//  Created by Sam Clemente on 7/3/24.
//

import Foundation
import SwiftUI

enum SystemColors: String, CaseIterable, Identifiable {
    case red = ".red"
    case orange = ".orange"
    case yellow = ".yellow"
    case green = ".green"
    case mint = ".mint"
    case teal = ".teal"
    case cyan = ".cyan"
    case blue = ".blue"
    case indigo = ".indigo"
    case purple = ".purple"
    case pink = ".pink"
    case brown = ".brown"
    
    var id: SystemColors { self }
    
    var color: Color {
        switch self {
        case .red:
            return .red
        case .orange:
            return .orange
        case .yellow:
            return .yellow
        case .green:
            return .green
        case .mint:
            return .mint
        case .teal:
            return .teal
        case .cyan:
            return .cyan
        case .blue:
            return .blue
        case .indigo:
            return .indigo
        case .purple:
            return .purple
        case .pink:
            return .pink
        case .brown:
            return .brown
        }
    }
}
