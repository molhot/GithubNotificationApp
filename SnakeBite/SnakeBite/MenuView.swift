//
//  MenuView.swift
//  SnakeBite
//
//  Created by __marimo__ on 2025/06/14.
//

import SwiftUI

struct MenuView: View {
    @State private var friendNames = ["太郎", "次郎", "花子", "Swift太郎"]
    
    var body: some View {
        ForEach(friendNames, id: \.self) { friendName in
            Menu {
                Button("電話する") {
                    // 処理
                }
                Button("メッセージを送る") {
                    // 処理
                }
            } label: {
                Image(systemName: "person.fill")
                Text(friendName)
            }
        }
        Divider()
        SettingsLink {
            Text("設定...")
        }
        .keyboardShortcut(",")
        Button("MenuBarExtraSampleについて") {
            showAbout()
        }
        Button("MenuBarExtraSampleを終了...") {
            quitApp()
        }
        .keyboardShortcut("Q")
    }
    
    private func showSettingsWindow() {
        NSApp.sendAction(Selector(("showSettingsWindow:")), to: nil, from: nil)
        NSApp.activate(ignoringOtherApps: true)
    }
    
    private func showAbout() {
        NSApp.activate(ignoringOtherApps: true)
        NSApp.orderFrontStandardAboutPanel()
    }
    
    private func quitApp() {
        NSApplication.shared.terminate(nil)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
