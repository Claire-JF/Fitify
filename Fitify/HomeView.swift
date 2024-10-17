import SwiftUI

struct HomeView: View {
    @State private var selectedGenres: Set<String> = []
    @State private var searchText = ""
    @State private var isSaving = false
    @State private var buttonText = "Save"
    
    let genres = ["Afro", "Alternative", "Ambient", "Anime", "Arab", "Asian-Pacific Islander", "Blues", "Brazilian", "Funk", "Cantopop", "Caribbean", "Christian / Gospel", "Classical", "Country", "Cumbia", "Dance / Electronic", "50s", "60s", "70s", "80s", "90s", "00s", "10s", "Desi", "Disney Soundtracks", "Flamenco", "Folk & Acoustic", "Francophone", "Funk & Disco", "Hindi / Bollywood", "Hip-Hop", "Indian Classical", "Indie", "Instrumental", "Jazz", "J-Tracks", "Kids & Family", "K-Pop", "Latin", "Lo-Fi", "Love / Romance", "Malay Pop", "Mandopop", "Metal", "Mexicana", "Nature Noises", "Party", "Pop", "Punjabi", "Punk", "R&B", "Rock", "Salsa", "Soul", "Tamil", "Telugu", "Zouk / Dancehall"]
    
    var filteredGenres: [String] {
        if searchText.isEmpty {
            return genres
        } else {
            return genres.filter { $0.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                
                List {
                    ForEach(filteredGenres, id: \.self) { genre in
                        GenreRow(genre: genre, isSelected: selectedGenres.contains(genre)) {
                            toggleGenre(genre)
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .background(Color(hex: "F2F0E4"))
                
                Button(action: {
                    saveGenres()
                }) {
                    Text(buttonText)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(hex: "F28705"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .scaleEffect(isSaving ? 0.95 : 1.0)
                        .animation(.easeInOut(duration: 0.2), value: isSaving)
                }
                .disabled(selectedGenres.count == 0 || selectedGenres.count > 5)
                .padding()
            }
            .navigationTitle("Select Music Preferences")
            .foregroundColor(Color(hex: "F24405"))
            .background(Color(hex: "FFD7A8")) // Updated background color
        }
        .accentColor(Color(hex: "F24405"))
    }
    
    private func toggleGenre(_ genre: String) {
        if selectedGenres.contains(genre) {
            selectedGenres.remove(genre)
        } else if selectedGenres.count < 5 {
            selectedGenres.insert(genre)
        }
        print("Selected genres: \(selectedGenres)")
    }
    
    private func saveGenres() {
        isSaving = true
        // Simulate a save operation
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            isSaving = false
            buttonText = "Saved!"
            // Reset button text after 2 seconds
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                buttonText = "Save"
            }
        }
    }
}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("Search", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(hex: "F2F0E4"))
                .cornerRadius(8)
                .foregroundColor(Color(hex: "F24405"))
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color(hex: "F24405"))
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        if !text.isEmpty {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(Color(hex: "F24405"))
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
        }
        .padding(.horizontal)
    }
}

struct GenreRow: View {
    let genre: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(genre)
                    .foregroundColor(Color(hex: "000000"))
                Spacer()
                if isSelected {
                    Image(systemName: "checkmark")
                        .foregroundColor(Color(hex: "F24405"))
                }
            }
        }
        .listRowBackground(Color(hex: "F2F0E4"))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
