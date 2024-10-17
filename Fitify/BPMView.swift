import SwiftUI

struct BPMView: View {
    @State private var currentBPM: Int? = nil
    @State private var isFetching = false
    @State private var showGenerateButton = false
    @Binding var selectedTab: Int
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var historyData: HistoryData
    
    // Add these properties to store recommended song info
    @State private var recommendedSong = ""
    @State private var recommendedArtist = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "FFD7A8").edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    
                    ZStack {
                        Circle()
                            .fill(Color(hex: "F28705"))
                            .frame(width: 200, height: 200)
                            .shadow(radius: 10)
                        
                        if let bpm = currentBPM {
                            Text("\(bpm)")
                                .font(.system(size: 60, weight: .bold))
                                .foregroundColor(.white)
                        } else if isFetching {
                            ProgressView()
                                .scaleEffect(2)
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        } else {
                            Image(systemName: "heart.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                                .foregroundColor(.white)
                        }
                    }
                    .animation(.spring(), value: isFetching)
                    
                    Spacer()
                    
                    if showGenerateButton {
                        Button(action: generateMusic) {
                            Text("Generate Your BPM-fitted Music")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color(hex: "F24405"))
                                .cornerRadius(15)
                        }
                        .padding(.horizontal)
                        .transition(.scale.combined(with: .opacity))
                    }
                    
                    Button(action: fetchBPM) {
                        Text("Fetch BPM")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color(hex: "F24405"))
                            .cornerRadius(15)
                    }
                    .padding(.horizontal)
                    .disabled(isFetching)
                }
            }
            .navigationTitle("Heart Rate")
        }
    }
    
    func fetchBPM() {
        isFetching = true
        currentBPM = nil
        showGenerateButton = false
        
        // Simulate fetching BPM from Apple Watch
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            currentBPM = Int.random(in: 60...120)
            isFetching = false
            withAnimation {
                showGenerateButton = true
            }
        }
    }
    
    func generateMusic() {
        // Simulate generating a song recommendation
        let songs = [
            ("Stayin' Alive", "Bee Gees"),
            ("Uptown Funk", "Mark Ronson ft. Bruno Mars"),
            ("I Wanna Dance with Somebody", "Whitney Houston"),
            ("Can't Stop the Feeling!", "Justin Timberlake"),
            ("Dancing Queen", "ABBA")
        ]
        
        let recommendation = songs.randomElement()!
        appState.currentSong = recommendation.0
        appState.currentArtist = recommendation.1
        appState.currentHeartRate = currentBPM ?? 0
        
        // Add the recommended song to history
        let newHistoryItem = HistoryItem(songName: appState.currentSong, 
                                         artistName: appState.currentArtist, 
                                         timestamp: Date(), 
                                         heartRate: appState.currentHeartRate)
        historyData.addItem(newHistoryItem)
        
        // Switch to the Player tab
        selectedTab = 2
    }
}

struct BPMView_Previews: PreviewProvider {
    static var previews: some View {
        BPMView(selectedTab: .constant(1))
    }
}
