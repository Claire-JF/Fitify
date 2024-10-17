//
//  ContentView.swift
//  Moodify
//
//  Created by Claire on 2024-10-13.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var appState = AppState()
    @StateObject private var historyData = HistoryData()
    @State private var selectedTab = 0
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Label("Genre", systemImage: "music.note.list")
                }
                .tag(0)
            BPMView(selectedTab: $selectedTab)
                .tabItem {
                    Label("BPM", systemImage: "heart.circle.fill")
                }
                .tag(1)
            PlayerView()
                .tabItem {
                    Label("Player", systemImage: "play.circle")
                }
                .tag(2)
            HistoryView()
                .tabItem {
                    Label("History", systemImage: "clock")
                }
                .tag(3)
        }
        .accentColor(Color(hex: "F24405"))
        .environmentObject(appState)
        .environmentObject(historyData)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Extension to use hex color codes
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
