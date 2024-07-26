//
//  SystemColorsTests.swift
//  RoutinesTests
//
//  Created by Sam Clemente on 7/26/24.
//

import Testing
import Foundation
import SwiftUI
@testable import Routines

/// Tests related to the ``SystemColors`` enum
struct SystemColorsTests {
    
    /// Tests to ensure each case in ``SystemColors`` corresponds to the proper ``Color`` from SwiftUI
    @Test func systemColorToColor() async throws {
        #expect(SystemColors.red.color == Color.red)
        #expect(SystemColors.orange.color == Color.orange)
        #expect(SystemColors.yellow.color == Color.yellow)
        #expect(SystemColors.green.color == Color.green)
        #expect(SystemColors.mint.color == Color.mint)
        #expect(SystemColors.teal.color == Color.teal)
        #expect(SystemColors.cyan.color == Color.cyan)
        #expect(SystemColors.blue.color == Color.blue)
        #expect(SystemColors.indigo.color == Color.indigo)
        #expect(SystemColors.purple.color == Color.purple)
        #expect(SystemColors.pink.color == Color.pink)
        #expect(SystemColors.brown.color == Color.brown)
    }
}
