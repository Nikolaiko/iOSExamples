import SwiftUI
import iOSDevPackage

struct ContentView: View {
    var body: some View {
        NavigationControllerView(transition: .custom(.slide, .slide)) {
            CountinentView()
        }
    }
}
