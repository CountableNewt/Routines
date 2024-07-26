//
//  StepTests.swift
//  RoutinesTests
//
//  Created by Sam Clemente on 7/26/24.
//

import Testing
import Foundation
@testable import Routines

/// All tests for the `Step` class
struct StepTests {
    
    /// Tests creation of a step using the default values
    @Test func stepCreationDefaults() async throws {
        let step = Step()
        
        #expect(step.id != nil)
        #expect(step.name == "Step")
        #expect(step.isComplete == false)
    }
    
    /// Tests creation of a step with a name passed to the initializer
    @Test func stepCreationWithValues() async throws {
        let step = Step(name: "Make Breakfast")
        
        #expect(step.id != nil)
        #expect(step.name == "Make Breakfast")
        #expect(step.isComplete == false)
    }
}
