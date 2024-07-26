//
//  IconListsTests.swift
//  RoutinesTests
//
//  Created by Sam Clemente on 7/26/24.
//

import Testing
import Foundation
import UIKit
@testable import Routines

/// All tests pertaining to the `IconLists` model
struct IconListsTests {
    private func isValidSFSymbol(_ symbol: String) -> Bool {
        return UIImage(systemName: symbol) != nil
    }
    
    /// Tests whether all strings in `IconLists`  are valid SF Symbol names
    @Test func isValidSFSymbol() async throws {
        for list in IconLists.allCases {
            for icon in list {
                #expect(isValidSFSymbol(icon))
            }
        }
    }
}
