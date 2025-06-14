//
//  SettingsView.swift
//  SnakeBite
//
//  Created by __marimo__ on 2025/06/14.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("yourName") var yourName = "User"
    
    var body: some View {
        TabView {
            Form {
                TextField("あなたの名前", text: $yourName)
            }
            .padding(20)
            .tabItem {
                Label("一般", systemImage: "slider.horizontal.3")
            }
        }
        .frame(width: 500, height: .none)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
