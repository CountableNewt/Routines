//
//  SystemColors.swift
//  Routines
//
//  Created by Sam Clemente on 7/3/24.
//

import Foundation
import SwiftUI

/// This enum is used to relate `Color` objects to `String` to be used for different cases in the app. The `rawValue` of each case is used for storing in `Routine.iconColor`. The enum conforms to `CaseIterable` and `Identifiable` for use in `ForEach()` views in the interface. `SystemColors.color` is used to generate the color picker UI in ``EditRoutineView``.
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
