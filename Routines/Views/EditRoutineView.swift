//
//  EditRoutineView.swift
//  Routines
//
//  Created by Sam Clemente on 7/2/24.
//

import Foundation
import SwiftUI

struct EditRoutineView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        Text("Edit Routine")
    }
}

#Preview {
    EditRoutineView(isPresented: .constant(true))
}
