import SwiftUI

struct HistoryItem: Identifiable {
    let id = UUID()
    let songName: String
    let artistName: String
    let timestamp: Date
    let heartRate: Int
}

class HistoryData: ObservableObject {
    @Published var historyItems: [HistoryItem] = [
        HistoryItem(songName: "Bohemian Rhapsody", artistName: "Queen", timestamp: Date(), heartRate: 75),
        HistoryItem(songName: "Shape of You", artistName: "Ed Sheeran", timestamp: Date().addingTimeInterval(-3600), heartRate: 80),
        HistoryItem(songName: "Blinding Lights", artistName: "The Weeknd", timestamp: Date().addingTimeInterval(-7200), heartRate: 78)
    ]
    
    func addItem(_ item: HistoryItem) {
        historyItems.insert(item, at: 0)
    }
}

struct HistoryView: View {
    @EnvironmentObject var historyData: HistoryData
    
    var body: some View {
        NavigationView {
            List {
                ForEach(historyData.historyItems) { item in
                    HistoryItemRow(item: item)
                }
            }
            .listStyle(PlainListStyle())
            .background(Color(hex: "FFD7A8"))
            .navigationTitle("Recommend History")
            .foregroundColor(Color(hex: "F24405"))
        }
        .accentColor(Color(hex: "F24405"))
    }
}

struct HistoryItemRow: View {
    let item: HistoryItem
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(item.songName)
                .font(.headline)
                .foregroundColor(Color(hex: "000000"))
            Text(item.artistName)
                .font(.subheadline)
                .foregroundColor(Color(hex: "F25C05"))
            HStack {
                Image(systemName: "clock")
                Text(item.timestamp, style: .time)
                Spacer()
                Image(systemName: "heart.fill")
                Text("\(item.heartRate) BPM")
            }
            .font(.caption)
            .foregroundColor(Color(hex: "F24405"))
        }
        .padding(.vertical, 5)
        .listRowBackground(Color(hex: "F2F0E4"))
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView().environmentObject(HistoryData())
    }
}
