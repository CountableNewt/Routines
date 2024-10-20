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
    
    var body: some View {
        Form {
            Section("Name") {
                TextField("Step", text: $newStep)
            }
        }
    }
}
