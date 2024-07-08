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
    var routine: Routine
    @Binding var isPresented: Bool
    
    var body: some View {
        EditRoutineView(routine: routine, isPresented: $isPresented)
    }
}

#Preview {
    AddRoutineView(routine: SampleRoutines.routines[0], isPresented: .constant(true))
}
