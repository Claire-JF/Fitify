# Fitify - iOS & WatchOS App

Fitify is an innovative iOS application that recommends music based on the user's heart rate and music preferences. The app integrates with Apple Watch for heart rate monitoring and Spotify for music playback.

## Features

1. Music Preference Selection
   - Users can select up to 5 music genres from a scrollable list with a search function.
   - Genres include a wide range of options from Afro to Zouk / Dancehall, including separate options for decades (50s, 60s, 70s, 80s, 90s, 00s, 10s).

2. Heart Rate Monitoring
   - Integrates with Apple Watch to fetch the user's current heart rate.
   - Requires authorization from the Health app.

3. Music Recommendation
   - Uses ChatGPT API to generate music recommendations based on the user's heart rate and genre preferences.

4. Spotify Integration
   - Plays the recommended song through Spotify after user authorization.

5. History Tracking
   - Keeps a record of played songs, including timestamp and heart rate at the time of play.

## App Interface

1. Home Page
   - Displays the genre preference selection list with a search function.
   - Includes a "Recommend" button to trigger the recommendation process.

2. History Page
   - Shows a list of previously played songs.
   - Each entry includes the song name, artist name, timestamp, and heart rate at the time of play.
   - Entries are displayed in reverse chronological order.

3. Player Page
   - Incorporates the Spotify API music player.
   - Displays the current heart rate.

## Color Palette

The app uses the following color palette:
- #F2F0E4 (Light Beige): Main background color
- #F28705 (Orange): Primary accent color
- #F25C05 (Dark Orange): Secondary accent color
- #F24405 (Red-Orange): Tertiary accent color
- #000000 (Black): Main text color

## Implementation Plan

1. Set up the basic app structure with three main views: Home, History, and Player.
2. Implement the genre selection interface on the Home page.
3. Set up Apple Watch connectivity for heart rate monitoring.
4. Integrate ChatGPT API for music recommendations.
5. Implement Spotify API integration for music playback.
6. Design and implement the History page.
7. Create the Player page with Spotify controls and heart rate display.
8. Implement data persistence for storing user preferences and play history.
9. Conduct thorough testing and bug fixing.
10. Prepare for App Store submission.

## Next Steps

1. Implement Apple Watch connectivity for heart rate monitoring.
2. Integrate ChatGPT API for music recommendations.
3. Set up Spotify API integration for music playback.

## Resources

- Spotify iOS SDK Documentation: https://developer.spotify.com/documentation/ios
- WatchConnectivity Documentation: https://developer.apple.com/documentation/watchconnectivity
- ChatGPT API Documentation: [Insert link here]
