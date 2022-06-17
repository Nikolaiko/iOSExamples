import SwiftUI

struct ContentView: View {
    @State var selectedIndex = 0

    var body: some View {
        TabView(selection: $selectedIndex) {
            MatchView().tag(0)
            ListView().tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
