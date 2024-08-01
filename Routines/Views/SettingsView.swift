//
//  SettingsView.swift
//  Routines
//
//  Created by Sam Clemente on 7/2/24.
//

import Foundation
import SwiftUI

struct SettingsView: View {
    @Environment(\.colorScheme) var colorScheme
    @StateObject private var socialLinkList = SocialLinkList()
    @Binding var isPresented: Bool
    
    let versionNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    let buildNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
    let logoWidth = 20.0
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Follow Us")) {
                    ForEach(socialLinkList.symbols) { symbol in
                        Button(action: {
                            guard let url = URL(string: symbol.url) else {
                                return
                            }
                            UIApplication.shared.open(url)
                        }) {
                            HStack {
                                Image(symbol.file)
                                    .foregroundStyle(symbol.color)
                                Text(symbol.name)
                                Spacer()
                                Image(systemName: "chevron.forward")
                                    .foregroundStyle(.tertiary)
                                    .font(.caption)
                            }
                            .contentShape(Rectangle())
                        }
                        .buttonStyle(.plain)
                    }
                }
                Section(header: Text("Donate")) {
                    Text("Coming Soon...")
                }
                Section(header: Text("Special Thanks")) {
                    Button(action: {
                        guard let url = URL(string: "https://github.com/jeremieb/social-symbols/tree/main") else {
                            return
                        }
                        UIApplication.shared.open(url)
                    }) {
                        HStack {
                            Text("Social Symbols")
                            Spacer()
                            Image(systemName: "chevron.forward")
                                .foregroundStyle(.tertiary)
                                .font(.caption)
                        }
                        .contentShape(Rectangle())
                    }
                    .buttonStyle(.plain)
                }
            }
            Spacer()
            Text("Version: \(versionNumber) (\(buildNumber))")
                .font(.caption)
        }
    }
}
