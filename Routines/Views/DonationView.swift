//
//  DonationView.swift
//  Routines
//
//  Created by Sam Clemente on 7/2/24.
//

import Foundation
import SwiftUI

struct DonationView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        Text("DonationView")
    }
}

#Preview {
    DonationView(isPresented: .constant(true))
}
