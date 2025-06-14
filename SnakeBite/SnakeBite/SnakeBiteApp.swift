//
//  SnakeBiteApp.swift
//  SnakeBite
//
//  Created by __marimo__ on 2025/06/14.
//

import SwiftUI

@main
struct SnakeBiteApp: App {
    var body: some Scene {
        MenuBarExtra() {
            MenuView()
        } label: {
            Image(systemName: "message.fill")
            Text("10件")
        }
        Settings {
            SettingsView()
        }
    }
}
