//
//  AddStepView.swift
//  Routines
//
//  Created by Sam Clemente on 7/2/24.
//

import Foundation
import SwiftUI

struct AddStepView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        Text("Add Step")
    }
}

#Preview {
    AddStepView(isPresented: .constant(true))
}
