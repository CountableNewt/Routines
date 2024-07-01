//
//  UIColorValueTransformer.swift
//  Routines
//
//  Created by Sam Clemente on 7/1/24.
//

/// This is a solution to persist UIColor with SwiftData I found here: https://stackoverflow.com/questions/77490973/can-uicolor-be-persisted-in-swiftdata
/// Here's a breakdown of the code (from Llama3):
/// 1. The class `UIColorValueTransformer` conforms to the `ValueTransformer` protocol.
/// 2. The `transformedValueClass()` method returns the class of the type that this value transformer transforms to/from, which is `UIColor`.
/// 3. The `transformedValue(_:)` method is responsible for transforming a given value (which is expected to be an instance of `UIColor`) into a serializable format.
///     * If the input value is not a valid `UIColor`, it returns `nil`.
///     * Otherwise, it uses `NSKeyedArchiver` to archive the `UIColor` object into a binary data format that can be stored in Core Data. The `requiringSecureCoding: true` parameter ensures that the archiving process is secure.
/// 4. If an error occurs during the archiving process, the method returns `nil`.

import Foundation
import SwiftUI
import SwiftData

@objc(UIColorValueTransformer)
final class UIColorValueTransformer: ValueTransformer {
    
    override class func transformedValueClass() -> AnyClass {
        return UIColor.self // Changed by ChatGPT
    }
    
    // return data
    override func transformedValue(_ value: Any?) -> Any? {
        guard let color = value as? UIColor else { return nil }

        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: true)
            return data
        } catch {
            return nil
        }
    }
    
    // Return UIColor
    override func reverseTransformedValue(_ value: Any?) -> Any? {
        guard let data = value as? Data else { return nil }
        
        do {
            let color = try NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: data)
            return color
        } catch {
            return nil
        }
    }
}
