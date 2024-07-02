//
//  CreateRoutineView.swift
//  Routines
//
//  Created by Sam Clemente on 7/2/24.
//

import Foundation
import SwiftData
import SwiftUI

struct AddRoutineView: View {
    @Environment(\.modelContext) var modelContext
    @Binding var isPresented: Bool
    
    var body: some View {
        Text("Add Routine")
    }
}

#Preview {
    AddRoutineView(isPresented: .constant(true))
}
