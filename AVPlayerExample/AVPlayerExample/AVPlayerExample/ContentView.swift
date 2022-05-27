import SwiftUI
import AVFoundation
import AVKit

struct ContentView: View {
    private let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "BS5", ofType: "mov")!))
       
       var body: some View {
         VideoPlayer(player: player)
                .onAppear() {
                    player.play()
                }
                .onDisappear() {
                    player.pause()
                }
       }
}

