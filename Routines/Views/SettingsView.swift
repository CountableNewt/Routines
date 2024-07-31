//
//  SettingsView.swift
//  Routines
//
//  Created by Sam Clemente on 7/2/24.
//

import Foundation
import SwiftUI

struct SettingsView: View {
    @Binding var isPresented: Bool
    let versionNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    let buildNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
    
    var body: some View {
        VStack {
            Spacer()
            Text("Version: \(versionNumber) (\(buildNumber))")
        }
    }
}
