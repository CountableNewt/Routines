//
//  EditRoutineView.swift
//  Routines
//
//  Created by Sam Clemente on 7/2/24.
//

import Foundation
import SwiftUI

struct EditRoutineView: View {
    @Bindable var routine: Routine
    @Binding var isPresented: Bool
    
    var body: some View {
        Form {
            Section("Name") {
                TextField("Routine Name", text: $routine.name)
            }
            Section("Time") {
                Text("Time Picker [To Be Implemented]")
                // DatePicker("Routine Time", selection: <#T##Binding<Date>#>)
            }
            EditIconView(routine: routine)
        }
    }
}

#Preview {
    EditRoutineView(routine: SampleRoutines.routines[0], isPresented: .constant(true))
}
