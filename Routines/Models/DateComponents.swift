//
//  DateComponents.swift
//  Routines
//
//  Created by Sam Clemente on 7/9/24.
//

import Foundation

extension DateComponents {
    func formattedTime() -> String {
        let calendar = Calendar.current
        if let date = calendar.date(from: self) {
            let formatter = DateFormatter()
            formatter.dateFormat = "h:mm a"
            return formatter.string(from: date)
        }
        return "Invalid Time"
    }
}
