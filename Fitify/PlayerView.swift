import SwiftUI

struct PlayerView: View {
    @EnvironmentObject var appState: AppState
    @State private var isPlaying = false
    @State private var progress: CGFloat = 0.0
    @State private var rotation: Double = 0.0
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "FFD7A8").edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    ZStack {
                        Circle()
                            .fill(Color(hex: "F2F0E4"))
                            .frame(width: 250, height: 250)
                        
                        Image(systemName: "music.note")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .foregroundColor(Color(hex: "F25C05"))
                            .rotationEffect(.degrees(rotation))
                            .animation(isPlaying ? Animation.linear(duration: 10).repeatForever(autoreverses: false) : .default, value: isPlaying)
                    }
                    
                    Text(appState.currentSong)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color(hex: "000000"))
                    
                    Text(appState.currentArtist)
                        .font(.title3)
                        .foregroundColor(Color(hex: "F25C05"))
                    
                    ProgressBar(progress: progress)
                        .frame(height: 10)
                        .padding(.horizontal)
                    
                    HStack(spacing: 40) {
                        Button(action: {
                            // TODO: Implement previous track function
                        }) {
                            Image(systemName: "backward.fill")
                                .font(.title)
                        }
                        
                        Button(action: {
                            withAnimation {
                                isPlaying.toggle()
                                if isPlaying {
                                    startRotation()
                                } else {
                                    stopRotation()
                                }
                            }
                        }) {
                            Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill")
                                .font(.system(size: 60))
                        }
                        
                        Button(action: {
                            // TODO: Implement next track function
                        }) {
                            Image(systemName: "forward.fill")
                                .font(.title)
                        }
                    }
                    .foregroundColor(Color(hex: "F28705"))
                    
                    Text("Current Heart Rate: \(appState.currentHeartRate) BPM")
                        .font(.headline)
                        .foregroundColor(Color(hex: "000000"))
                        .padding()
                        .background(Color(hex: "F24405").opacity(0.1))
                        .cornerRadius(10)
                }
                .padding()
            }
            .navigationTitle("Now Playing")
            .foregroundColor(Color(hex: "F24405"))
        }
        .accentColor(Color(hex: "F24405"))
    }
    
    private func startRotation() {
        withAnimation(.linear(duration: 0.01)) {
            rotation += 360
        }
    }
    
    private func stopRotation() {
        withAnimation(.linear(duration: 0.01)) {
            rotation = 0
        }
    }
}

struct ProgressBar: View {
    var progress: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color(hex: "F28705").opacity(0.3))
                
                Rectangle()
                    .fill(Color(hex: "F28705"))
                    .frame(width: geometry.size.width * progress)
            }
            .cornerRadius(5)
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
