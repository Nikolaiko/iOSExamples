import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            DefaultView()
                .tabItem { Text("First") }
            RotatedView()
                .tabItem { Text("Second") }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
