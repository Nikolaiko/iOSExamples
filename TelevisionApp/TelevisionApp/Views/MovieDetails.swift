import SwiftUI

struct MovieDetails: View {

    let itemNames = Array(1...4).map { "b\($0)" }

    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    NavigationLink(destination: PlayerView()) {
                        Label("play", systemImage: "play")
                    }
                    NavigationLink(destination: Text(movieDesc)) {
                        Text(movieDesc)
                            .lineLimit(3)
                            .multilineTextAlignment(.leading)
                    }
                }
                .padding(40)

                MoviesView()
            }
            .padding(.top, 500)
        }
        .background(
            Image(itemNames.shuffled().first ?? "b1")
                .opacity(0.7)
                .blur(radius: 3.0)
        )
        .edgesIgnoringSafeArea(.horizontal)
    }
}

struct MovieDetails_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetails()
    }
}
