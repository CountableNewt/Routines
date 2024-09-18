//
//  AddStepView.swift
//  Routines
//
//  Created by Sam Clemente on 7/2/24.
//

import Foundation
import SwiftUI

struct AddStepView: View {
    @Binding var newStep: String
    @Binding var isPresented: Bool
    @Binding var days: [String]
    var iconColor: Color
    
    var body: some View {
        Form {
            Section("Name") {
                TextField("Step", text: $newStep)
            }
            Section("Days") {
                EditDaysView(days: $days, iconColor: iconColor)
            }
        }
    }
}
