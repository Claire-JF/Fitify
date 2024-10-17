import SwiftUI

class AppState: ObservableObject {
    @Published var currentSong: String = "Not Playing"
    @Published var currentArtist: String = "Unknown Artist"
    @Published var currentHeartRate: Int = 0
}
