import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            TabView {
                ScrollView {
                    SliderView()
                    MoviesView()
                    MoviesView()
                    MoviesView()
                }
                .tabItem {
                    Text("Main")
                }

                ScrollView {
                    MoviesView()
                    MoviesView()
                    MoviesView()
                    MoviesView()
                }
                    .tabItem {
                        Text("Series")
                    }

                ProfileView()
                    .tabItem {
                        Text("Profile")
                    }
            }
        }
        .edgesIgnoringSafeArea(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
